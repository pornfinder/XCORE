#pragma once

#include "../memory/memory.cpp"
#include "../cpu/cpu.cpp"
//#include "initlist.cpp"

template<typename T>
class managed {
protected:
    T *_data;
    int _size = 0;
    int _capacity = 16;

    bool nullend = false;

    void grow_if_needed() {
        if (_size >= _capacity) {
            _capacity = _capacity ? _capacity * 2 : 16;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }
    }

public:

    managed() : _data(nullptr), _size(0), _capacity(0) {}

    explicit managed(int capacity) {
        _capacity = capacity > 0 ? capacity : 16;
        _data = (T *) (calloc(_capacity, sizeof(T)));
        _size = 0;
    }

    managed(const managed<T>& other) {
        _capacity = other._capacity;
        _size = other._size;
        _data = (T *) (calloc(_capacity, sizeof(T)));
        memcpy(_data, other._data, _size * sizeof(T));
    }

    managed(managed<T>&& other) noexcept {
        _data = other._data;
        _size = other._size;
        _capacity = other._capacity;

        other._data = nullptr;
        other._size = 0;
        other._capacity = 0;
    }

    ~managed() {
        free(_data);
    }

    managed<T>& operator=(const managed<T>& other) {
        if (this != &other) {
            free(_data);
            _capacity = other._capacity;
            _size = other._size;
            _data = (T *) (calloc(_capacity, sizeof(T)));
            memcpy(_data, other._data, _size * sizeof(T));
        }
        return *this;
    }

    managed<T>& operator=(managed<T>&& other) noexcept {
        if (this != &other) {
            free(_data);
            _data = other._data;
            _size = other._size;
            _capacity = other._capacity;

            other._data = nullptr;
            other._size = 0;
            other._capacity = 0;
        }
        return *this;
    }

    void push_back(const T& value) {
        insert(_size, value);

    }

    void push_back(T&& value) {
        insert(_size, value);
    }

    void insert(int index, const T& value) {
        if (index < 0 || index > _size) panic("Index out of range");

        grow_if_needed();

        for (int i = _size; i > index; i--) {
            _data[i] = _data[i - 1];
        }
        _data[index] = value;
        _size++;
    }

    void remove(int index) {
        if (index < 0 || index >= _size) panic("Index out of range");

        for (int i = index; i < _size - 1; i++) {
            _data[i] = _data[i + 1];
        }
        _size--;
    }

    T &operator[](int index) {
        if (index < 0 || index >= _size) panic("Index out of range");
        return _data[index];
    }

    const T &operator[](int index) const {
        if (index < 0 || index >= _size) panic("Index out of range");
        return _data[index];
    }

    managed<T> operator+(const T& value) const {
        managed res(*this);
        res.push_back(value);
        return res;
    }

    managed<T> operator+(const managed<T>& other) const {
        managed<T> res;
        res._capacity = _size + other._size;
        res._data = (T *) (calloc(res._capacity, sizeof(T)));

        if (_size > 0) {
            memcpy(res._data, _data, _size * sizeof(T));
        }
        if (other._size > 0) {
            memcpy(res._data + _size, other._data, other._size * sizeof(T));
        }

        res._size = _size + other._size;
        return res;
    }

    managed<T>& operator+=(const T& value) {
        push_back(value);
        return *this;
    }

    managed<T>& operator+=(const T&& value) {
        push_back(value);
        return *this;
    }

    managed<T>& operator+=(const managed<T>& other) {
        int old_size = _size;
        _size += other._size;

        if (_size > _capacity) {
            _capacity = _size;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }

        if (other._size > 0) {
            memcpy(_data + old_size, other._data, other._size * sizeof(T));
        }

        return *this;
    }

    bool operator==(const managed<T>& other) const {
        if (_size != other._size) return false;
        for (int i = 0; i < _size; i++) {
            if (_data[i] != other._data[i]) return false;
        }
        return true;
    }

    bool operator!=(const managed<T>& other) const {
#pragma clang diagnostic push
#pragma ide diagnostic ignored "Simplify"
        return !(*this == other);
#pragma clang diagnostic pop
    }

    T *data() {
        return _data;
    }

    const T *data() const {
        return _data;
    }

    int size() const {
        return _size;
    }

    int capacity() const {
        return _capacity;
    }

    bool empty() const {
        return _size == 0;
    }

    void clear() {
        _size = 0;
    }

    void reserve(int new_capacity) {
        if (new_capacity > _capacity) {
            _capacity = new_capacity;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }
    }

    void shrink_to_fit() {
        if (_size < _capacity) {
            _capacity = _size > 0 ? _size : 1;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }
    }

//    managed(initializer_list<T> init) {
//        _capacity = init.size() > 0 ? init.size() : 16;
//        _data = (T *)calloc(_capacity, sizeof(T));
//        _size = 0;
//        for (const T& item : init) {
//            push_back(item);
//        }
//    }

    template<size_t N>
    managed(const T (&array)[N]) {
        _capacity = N > 0 ? N : 16;
        _data = (T *)calloc(_capacity, sizeof(T));
        _size = 0;
        for (size_t i = 0; i < N; i++) {
            push_back(array[i]);
        }
    }

    template<size_t N>
    managed<T>& operator+=(const T (&array)[N]) {
        for (size_t i = 0; i < (nullend ? (N-1) : N); i++) {
            push_back(array[i]);
        }
        return *this;
    }

    template<size_t N>
    managed<T> operator+(const T (&array)[N]) const {
        managed<T> res(*this);
        for (size_t i = 0; i < (nullend ? (N-1) : N); i++) {
            res.push_back(array[i]);
        }
        return res;
    }
};

#include "string.cpp"
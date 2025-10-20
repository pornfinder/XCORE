#pragma once

#include "managed.cpp"

template<typename T> class initializer_list : public managed<T> {

};
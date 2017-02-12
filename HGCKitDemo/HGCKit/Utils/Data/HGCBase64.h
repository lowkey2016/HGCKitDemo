

#ifndef __BASE64_INCLUDE__
#define __BASE64_INCLUDE__

#include <string>

void hgc_base64_encode(std::string & dst, const std::string & src);
int hgc_base64_decode(std::string & dst, const std::string & src);

#endif


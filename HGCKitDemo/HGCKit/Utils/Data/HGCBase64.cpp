

#include "HGCBase64.h"
#include <string>

using std::string;

void hgc_base64_encode(std::string &dst, const std::string & src) {
	unsigned char *d, *s;
	size_t len;
	static char basis64[] =
			"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

	len = src.size();
	s = (unsigned char*) src.c_str();

	dst.resize(len * 2);

	d = (unsigned char *) dst.c_str();

	while (len > 2) {
		*d++ = basis64[(s[0] >> 2) & 0x3f];
		*d++ = basis64[((s[0] & 3) << 4) | (s[1] >> 4)];
		*d++ = basis64[((s[1] & 0x0f) << 2) | (s[2] >> 6)];
		*d++ = basis64[s[2] & 0x3f];

		s += 3;
		len -= 3;
	}

	if (len) {
		*d++ = basis64[(s[0] >> 2) & 0x3f];

		if (len == 1) {
			*d++ = basis64[(s[0] & 3) << 4];
			*d++ = '=';

		} else {
			*d++ = basis64[((s[0] & 3) << 4) | (s[1] >> 4)];
			*d++ = basis64[(s[1] & 0x0f) << 2];
		}

		*d++ = '=';
	}
	dst.resize(d - (unsigned char*) dst.c_str());
	return;
}

int hgc_base64_decode(std::string &dst, const std::string & src) {
	static char basis[] = { 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 62, 77, 77, 77,
			63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 77, 77, 77, 77, 77, 77,
			77, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
			18, 19, 20, 21, 22, 23, 24, 25, 77, 77, 77, 77, 77, 77, 26, 27, 28,
			29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
			46, 47, 48, 49, 50, 51, 77, 77, 77, 77, 77,

			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
			77, 77, 77, 77, 77, 77, 77, 77, 77 };

	size_t len;
	char *d, *s;
	char *src_data = (char*) src.c_str();

	dst.resize(src.size());

	for (len = 0; len < src.size(); len++) {
		if (src_data[len] == '=') {
			break;
		}

		if (basis[src_data[len]] == 77) {
			return -1;
		}
	}

	if (len % 4 == 1) {
		return -2;
	}

	s = (char *) src.c_str();
	d = (char *) dst.c_str();

	while (len > 3) {
		*d++ = (char) (basis[s[0]] << 2 | basis[s[1]] >> 4);
		*d++ = (char) (basis[s[1]] << 4 | basis[s[2]] >> 2);
		*d++ = (char) (basis[s[2]] << 6 | basis[s[3]]);

		s += 4;
		len -= 4;
	}

	if (len > 1) {
		*d++ = (char) (basis[s[0]] << 2 | basis[s[1]] >> 4);
	}

	if (len > 2) {
		*d++ = (char) (basis[s[1]] << 4 | basis[s[2]] >> 2);
	}

	dst.resize(d - (char*) dst.c_str());

	return 0;
}


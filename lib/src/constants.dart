// List of ALPN tokens of supported HTTP/3 versions.
const QUICHE_H3_APPLICATION_PROTOCOL = "\x05h3-27\x05h3-25\x05h3-24\x05h3-23";

// The current QUIC wire version.
const QUICHE_PROTOCOL_VERSION = 0xff00001b;

// The maximum length of a connection ID.
const QUICHE_MAX_CONN_ID_LEN = 20;

// The minimum length of Initial packets sent by a client.
const QUICHE_MIN_CLIENT_INITIAL_LEN = 1200;
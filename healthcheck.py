import socket, sys
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.settimeout(9.0)
s.connect((socket.gethostbyname(socket.gethostname()), int(sys.argv[1])))
try:
	s.send(b'\xFF\xFF\xFF\xFFTSource Engine Query\x00')
	s.recv(4096)
	print(0)
except socket.error as e:
	print(1)
	raise SystemExit(1)

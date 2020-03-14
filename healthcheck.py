import socket, sys
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.settimeout(1.0)
s.connect((socket.gethostbyname(socket.gethostname()), int(sys.argv[1])))
try:
	s.send(b'\xFF\xFF\xFF\xFF\x550xFFFFFFFF')
	s.recv(4096)
	print(0)
	exit(0)
except socket.error as e:
	print(1)
	exit(1)

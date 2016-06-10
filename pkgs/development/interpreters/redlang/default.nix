{ stdenv, fetchFromGitHub, cmake, zlib, sqlite, gmp, libffi, cairo }:

stdenv.mkDerivation rec {
  name = "redlang-${version}";
  version = "0.6.0";

  src = fetchFromGitHub {
    rev = "6b4ec6b881f5ce35590d24f5abf6ca1e4ca17945";
    repo = "red";
    owner = "red";
    sha256 = "1426hb8w0wpkisvmf3danj656j6g7rc6v91gqbgzkcj485qjaliw";
  };

  buildInputs = [
     unzip
     pkgconfig
     ncurses
  ];

  meta = with stdenv.lib; {
    description = "A functional, prototype based, Homoiconic, optionally typed language";
    homepage = http://www.red-lang.com;
    license = licenses.bsd3;
    maintainers = [ maintainers.vrthra ];
  };
}

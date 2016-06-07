{ stdenv, fetchFromGitHub, bison }:

stdenv.mkDerivation rec {
  name = "pLucid-${version}";
  version = "0.1";
  src = fetchFromGitHub {
    repo = "plucid";
    owner = "vrthra";
    rev = "37ce9303d43f0b428927577143dcb56b9be73390";
    sha256 = "13pvgxzcpz113z9kpyqwag2fb1pp4i7w25iqcvvidd4g6nc6xxwf";
  };
  buildInputs = [ bison ];
  installPhase = ''
     mkdir -p $out/bin
     make all "DESTDIR=$out/bin"
  '';

  meta = with stdenv.lib; {
    description = "Lucid programming language, the original dataflow programming language";
    maintainers = with maintainers; [ vrthra ];
    platforms = platforms.unix;
    license = licenses.gpl2;
    homepage = https://github.com/vrthra/plucid;
  };
}

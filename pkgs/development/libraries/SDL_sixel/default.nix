{ stdenv, fetchFromGitHub, fetchpatch, pkgconfig, audiofile, libcap }:

stdenv.mkDerivation rec {
  version = "1.2";
  name    = "SDL_sixel-${version}";

  src = fetchFromGitHub {
    owner = "saitoha";
    repo = "SDL1.2-SIXEL";
    rev = "ab3fccac6e34260a617be511bd8c2b2beae41952";
    sha256 = "0gm2vngdac17lzw9azkhzazmfq3byjddms14gqjk18vnynfqp5wp";
  };

  outputs = [ "dev" "out" ];
  outputBin = "dev"; # sdl-config

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ pkgconfig ];

  configureFlags = [
    "--disable-oss"
    "--disable-video-x11-xme"
    "--disable-x11-shared"
    "--disable-alsa-shared"
    "--enable-rpath"
    "--disable-pulseaudio-shared"
    "--disable-osmesa-shared"
  ];

  meta = with stdenv.lib; {
    description = "A cross-platform multimedia library";
    homepage    = http://www.libsdl.org/;
    maintainers = with maintainers; [ lovek323 ];
    platforms   = platforms.unix;
    license     = licenses.lgpl21;
  };
}

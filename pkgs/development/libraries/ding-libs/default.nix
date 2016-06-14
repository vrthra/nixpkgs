{ stdenv, fetchurl, pkgconfig}:

stdenv.mkDerivation rec {

   name = "ding-libs-${version}";
   version = "0.4.0";
   src = fetchurl {
       url = "https://fedorahosted.org/released/ding-libs/${name}.tar.gz";
       sha256 = "bdeb90b07ceaa9145e6784ce40a71b69a37fffc7373c51fee258ffffd5390457";
   };
   buildInputs = [ pkgconfig ];

   meta = {
      description = "DING-LIBS (DING Is Not Glib) are a set of small, useful libraries that SSSD uses and makes available to other projects.";
      homepage = https://fedorahosted.org/sssd;
   };
}

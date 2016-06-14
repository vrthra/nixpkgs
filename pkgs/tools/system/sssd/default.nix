{stdenv, fetchurl, pkgconfig, popt, talloc, tdb
, tevent, ldb, ding-libs, pam, openldap, pcre
, libkrb5, c-ares, bind, cifs_utils, cyrus_sasl
, libnfsidmap, augeas, glib, dbus, libxslt
, docbook5_xsl, docbook_xml_xslt, python3
, libselinux, libsemanage, nss, nspr, libxml2
, ncurses}:

stdenv.mkDerivation rec {

   name = "sssd-${version}";
   version = "1.12.5";
   src = fetchurl {
       url = "https://fedorahosted.org/released/sssd/sssd-1.12.5.tar.gz";
       sha256 = "243d8db7c72ecb21aa9db8a09fe9f9b10049dbdb35a1cc2f55e214f21e3ce256";
   };
   buildInputs = [ pkgconfig  popt talloc tdb tevent ldb
ding-libs pam openldap pcre libkrb5 c-ares bind cifs_utils
cyrus_sasl libnfsidmap augeas glib dbus libxslt docbook5_xsl
docbook_xml_xslt python3 libselinux libsemanage nss nspr libxml2
ncurses];
   configurePhase=''
      p=$(cd $out; pwd)
      ./configure --prefix=$prefix --without-samba --with-ldb-lib-dir=$p/lib/ldb
   '';
   NIX_CFLAGS_COMPILE="-I${libxml2}/include/libxml2/ -I${ncurses}/include/";
   NIX_LDFLAGS_COMPILE="-L${ncurses}/include/ -lncurses";
   postBuild=''
    mkdir -p $out/lib/ldb
    cp .libs/memberof.so $out/lib/ldb
   '';
   meta = {
      description = "SSSD is a system daemon. Its primary function is to provide access to identity and authentication remote resource through a common framework that can     provide caching and offline support to the system.";
      homepage = https://fedorahosted.org/sssd;
   };
}

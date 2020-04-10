{ stdenv, fetchurl, zlib, autoPatchelfHook, libpulseaudio, gcc-unwrapped, alsaLib }:

stdenv.mkDerivation rec {
  pname = "studio-link";
  version = "v20.03.8";

  src = fetchurl {
    url = "https://download.studio.link/releases/v20.03.8-stable/linux/studio-link-standalone-v20.03.8.tar.gz";
    sha256 = "1xwnai3nz6larz4c99zr1s76ayhya6yxic3bdwa84p41vyb6rrdg";
  };

  buildInputs = [ zlib libpulseaudio gcc-unwrapped alsaLib ];
  nativeBuildInputs = [ autoPatchelfHook ];

  # The tarball doesn't contain a directory to change into.
  setSourceRoot = "sourceRoot=`pwd`";
  
  installPhase = ''
    mkdir -p $out/bin
    install -m 0755 ${pname}-standalone-${version} $out/bin/${pname}-standalone
  '';

  meta = with stdenv.lib; {
    description = "Stand-alone Audio-over-IP solution";
    homepage = "https://studio-link.de/";
    platforms = [ "x86_64-linux" ];
    license = licenses.unfree;
  };
}

{ stdenv, fetchurl, zlib, autoPatchelfHook, libpulseaudio, gcc-unwrapped, alsaLib }:

stdenv.mkDerivation rec {
  pname = "studio-link";
  version = "v20.12.1";

  src = fetchurl {
    url = "https://download.studio.link/releases/${version}-stable/linux/studio-link-standalone-${version}.tar.gz";
    sha256 = "1sid09z31mqyqj37kcg1nvhgf0azkb9a4dq9fw19sqca98w5dpcg";
  };

  buildInputs = [ zlib libpulseaudio alsaLib ];
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

    # TODO How can we set this and still build with Hercules CI?
    #license = licenses.unfree;
  };
}

{ stdenv, fetchFromGitHub }:
{
  sddm-sugar-dark = stdenv.mkDerivation rec {
    pname = "sddm-sugar-dark-theme";
    version = "1.2";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/sugar-dark
    '';
    src = fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "v${version}";
      sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb";
    };
  };

  tokyo-night = stdenv.mkDerivation rec {
    pname = "tokyo-night";
    version = "1.0";
    dontBuild = true;
    src = fetchFromGitHub {
      owner = "rototrash";
      repo = "tokyo-night-sddm";
      rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
      hash = "sha256-JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/tokyo-night
    '';
  };

}
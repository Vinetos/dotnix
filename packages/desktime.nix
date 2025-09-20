{ lib
, appimageTools
, fetchurl
,
}:

let
  version = "6.1.0";
  pname = "desktime";

  src = fetchurl {
    url = "https://desktime.com/updates/electron/linux";
    name = "desktime-${version}.AppImage";
    hash = "sha256-TZp2Tl+sN1AO4nw1KSNfQkHGrGIPXCZlSg+eOhqBIkY=";
  };

  contents = appimageTools.extract { inherit pname src version; };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${contents}/DeskTime.desktop $out/share/applications/DeskTime.desktop
    substituteInPlace $out/share/applications/DeskTime.desktop --replace-fail 'Exec=AppRun' 'Exec=${meta.mainProgram}'
  '';

  meta = with lib; {
    description = "Instant messaging service part of Infomaniak KSuite";
    homepage = "https://www.infomaniak.com/en/apps/download-kchat";
    license = licenses.unfree;
    maintainers = [ maintainers.vinetos ];
    mainProgram = "kchat";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    longDescription = ''
      kChat is an instant messaging service which enables you to discuss, share and coordinate your teams in complete
      security via your Internet browser, mobile phone, tablet or computer.
    '';
  };
}

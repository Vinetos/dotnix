{
  lib,
  fetchurl,
  appimageTools,
}:

appimageTools.wrapType2 rec {
  pname = "kchat-desktop";
  version = "3.5.0-beta.9";

  src = fetchurl {
    url = "https://download.storage5.infomaniak.com/kchat/${pname}-${version}-linux-x86_64.AppImage";
    name = "kchat-${version}.AppImage";
    hash = "sha256-GJZQCXkLDw90JvpB6WmR9Kg3Xf4WPlH48ME+xw/2v70=";
  };

  extraInstallCommands =
    let
      contents = appimageTools.extractType2 { inherit pname version src; };
    in
    ''
      install -m 444 -D ${contents}/${pname}.desktop $out/share/applications/${pname}.desktop
      install -m 444 -D ${contents}/usr/share/icons/hicolor/0x0/apps/${pname}.png $out/share/icons/hicolor/0x0/apps/kchat-desktop.png

      substituteInPlace $out/share/applications/${pname}.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
   '';

  meta = {
    description = "Instant messaging service part of Infomaniak KSuite";
    homepage = "https://www.infomaniak.com/en/apps/download-kchat";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.vinetos ];
    mainProgram = "kchat";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    longDescription = ''
      kChat is an instant messaging service which enables you to discuss, share and coordinate your teams in complete
      security via your Internet browser, mobile phone, tablet or computer.
    '';
  };
}

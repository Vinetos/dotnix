{ lib
, buildGoModule
, fetchFromGitHub
,
}:

buildGoModule {

  pname = "openstack-exporter";
  version = "latest";

  src = fetchFromGitHub {
    owner = "openstack-exporter";
    repo = "openstack-exporter";
    rev = "20f5bdd0e40a2ca5512471f86fdf2981f8caf350"; # Latest commit hash
    hash = "sha256-bn816FOOEeW+RRdbaIpx+NHzTeqI9wpJBnBm5PfjzJI=";
  };

  vendorHash = "sha256-KoZqgPJEqEDcz4KlP8c/euGp51/fbj0NOj8mccGCZPE=";

  meta = with lib; {
    description = "Openstack exporter built in go";
    homepage = "https://github.com/openstack-exporter/openstack-exporter";
    license = licenses.mit;
    maintainers = [ maintainers.vinetos ];
    mainProgram = "openstack-exporter";
  };
}

let
  topUrl =
    domain:
    "https://${domain}/s/kraken/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(),filters:!(),index:logs,interval:auto,query:(language:kuery,query:''),sort:!(!('@timestamp',desc)))";
  topDirectory = {
    name = "TOP";
    bookmarks = [
      {
        name = "TOP Nbcu Dev";
        url = topUrl "top-dev.telemetry.nbcuott.com";
      }
      {
        name = "TOP Nbcu Stage";
        url = topUrl "top-stage.telemetry.nbcuott.com";
      }
      {
        name = "TOP Nbcu Prod";
        url = topUrl "top-prod.telemetry.nbcuott.com";
      }
      {
        name = "TOP Sky Dev";
        url = topUrl "top.telem.dev-aws.ottlocal.sky";
      }
      {
        name = "TOP Sky Stage";
        url = topUrl "top.telem.stage-aws.ottlocal.sky";
      }
      {
        name = "TOP Sky Prod";
        url = topUrl "top.telem.prod-aws.ottlocal.sky";
      }
    ];
  };
in
[
  {
    name = "Toolbar";
    toolbar = true;
    bookmarks = [
      {
        name = "Apps SSO";
        url = "https://myapplications.microsoft.com/";
      }
      {
        name = "Kraken Jenkins";
        url = "https://jenkins-kraken.tools.cosmic.sky/";
      }
      {
        name = "Core Platform Docs";
        url = "https://core-docs.dev.ce.eu-central-1-aws.npottdc.sky/docs/tenant-wiki/";
      }
    ];
  }
  topDirectory
]

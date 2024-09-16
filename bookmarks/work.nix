let
  awsUrl =
    uuid:
    "https://launcher.myapps.microsoft.com/api/signin/${uuid}?tenantId=68b865d5-cf18-4b2b-82a4-a4eddb9c5237";
  topUrl =
    domain:
    "https://${domain}/s/kraken/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(),filters:!(),index:logs,interval:auto,query:(language:kuery,query:''),sort:!(!('@timestamp',desc)))";
  awsDirectory = {
    name = "AWS";
    bookmarks = [
      {
        name = "AWS Nbcu Nbcu Dev";
        url = awsUrl "533cfe7c-1de3-41e6-9ee4-4b023b417d2c";
      }
      {
        name = "AWS Nbcu Nbcu Stage";
        url = awsUrl "bdb20e7f-66ca-4989-a2df-799bc889e296";
      }
      {
        name = "AWS Nbcu Nbcu Prod";
        url = awsUrl "0f405305-179b-4505-81eb-4c53e3f1a6f7";
      }
      {
        name = "AWS Sky Sky Dev";
        url = awsUrl "46798dc9-b1bf-4f65-a478-ef3a5f675188";
      }
      {
        name = "AWS Sky Sky Stage";
        url = awsUrl "a6c5aae7-f214-4d27-9557-d02742773d15";
      }
      {
        name = "AWS Sky Sky Prod";
        url = awsUrl "c95847e2-e151-4bc0-a4ad-ed691681c4e4";
      }
      {
        name = "AWS Summer Showmax Stage";
        url = awsUrl "18850135-5a40-45ec-8f29-c7bcdc0ea62f";
      }
      {
        name = "AWS Summer Showmax Prod";
        url = awsUrl "b7f40599-ef03-4641-9c67-4eb2793941c2";
      }
      {
        name = "AWS Summer Showtime Stage";
        url = awsUrl "dc68ca8a-6c3f-42be-814b-ab329bcfb890";
      }
      {
        name = "AWS Summer Showtime Prod";
        url = awsUrl "873153b9-d5b6-445b-ac14-a2ea473abae1";
      }
    ];
  };
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
      {
        name = "Top Summer Stage";
        url = topUrl "top-sum-stage.telemetry.nbcuott.com";
      }
      {
        name = "Top Summer Prod";
        url = topUrl "top-sum-prod.telemetry.nbcuott.com";
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
      {
        name = "Core Platform Grafana";
        url = "https://grafana.tools.cosmic.sky/?orgId=1";
      }
      {
        name = "VDC Portal";
        url = "https://portal.vdc.cloud.sky/automation/#/service/catalog";
      }
    ];
  }
  awsDirectory
  topDirectory
]

use strict;
use warnings;
use File::Find;

my $directory = $ARGV[0] or die "Must supply the directory to process";

# Gather a list of all files in the specified directory
my @files;
find(\&assembleFiles, $directory);

# Process each schema file (.xsd)
foreach my $file (@files)
{
  if ($file =~ /\.xsd$/)
  {
    processSchemas($file);
  }
}

exit;


sub assembleFiles
{
  push @files, $File::Find::name;

  return;
}


sub processSchemas
{
  my $schema = shift;

  print "Processing $schema\n";

  # Create a temporary copy of the schema and a new file to hold the modified contents
  my $tmp = "$schema.bck";
  rename $schema, $tmp or die "Could not create temporary copy of $schema: $!";
  open(my $in, "<", $tmp) or die "Could not open temporary copy of $schema: $!";
  open(my $out, ">", $schema) or die "Could not create new version of $schema: $!";

  my $firstBaseImport = 1;
  my $firstFlightImport = 1;
  my $recordAttributeBlock = 0;
  my @attributeBlock;
  my $sortAttributes = 0;

  # Read and process each line of the schema
  while(my $line = <$in>)
  {
    modifyLine($out, $line, \$firstBaseImport, \$firstFlightImport, $schema, \$recordAttributeBlock, \@attributeBlock, \$sortAttributes);
  }

  close $in;
  close $out;

  # Remove temporary copy
  unlink $tmp or die "Could not remove temporary copy of $schema: $!";

  return;
}


sub modifyLine
{
  my $out = shift;
  my $line = shift;
  my $firstBaseImport = shift;
  my $firstFlightImport = shift;
  my $schema = shift;
  my $recordAttributeBlock = shift;
  my $attributeBlock = shift;
  my $sortAttributes = shift;

  my $skipLine = 0;

  # Remove empty sequences (artifact of EA schema gen)
  if ($line =~ /<xs:sequence\/>/)
  {
    $skipLine = 1;
  }
  # Replace Flight package imports with a single import of appropriate Flight.xsd
  elsif ($line =~ /(.*<xs:import.*www.fixm.aero\/flight.*\/flight\/)/)
  {
    my $match = $1;
    if ($$firstFlightImport)
    {
      if ($schema =~ /\/filedflightplan\//)
      {
        $line = $match . "FficeFFP_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/filingstatus\//)
      {
        $line = $match . "FficeFS_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightarrival\//)
      {
        $line = $match . "FficeFA_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightcancellation\//)
      {
        $line = $match . "FficeFC_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdatarequest\//)
      {
        $line = $match . "FficeFDRQ_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdataresponse\//)
      {
        $line = $match . "FficeFDRP_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdeparture\//)
      {
        $line = $match . "FficeFD_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightplanupdate\//)
      {
        $line = $match . "FficeFPU_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/planningstatus\//)
      {
        $line = $match . "FficePS_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/preliminaryflightplan\//)
      {
        $line = $match . "FficePFP_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/submissionresponse\//)
      {
        $line = $match . "FficeSR_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/trialrequest\//)
      {
        $line = $match . "FficeTRQ_Flight.xsd\"/>\n";
      }
      elsif ($schema =~ /\/trialresponse\//)
      {
        $line = $match . "FficeTRP_Flight.xsd\"/>\n";
      }
      else
      {
        $line = $match . "Flight.xsd\"/>\n";
      }
      $$firstFlightImport = 0;
    }
    else
    {
      $skipLine = 1;
    }
  }
  # Replace Base package imports with a single import of appropriate Base.xsd
  elsif ($line =~ /(.*<xs:import.*www.fixm.aero\/base.*\/base\/)/)
  {
    my $match = $1;
    if ($$firstBaseImport)
    {
      if ($schema =~ /\/filedflightplan\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFFP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/filedflightplan\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFFP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/filingstatus\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFS_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/filingstatus\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFS_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightarrival\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFA_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightarrival\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFA_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightcancellation\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFC_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightcancellation\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFC_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdatarequest\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFDRQ_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdatarequest\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFDRQ_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdataresponse\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFDRP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdataresponse\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFDRP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdeparture\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFD_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightdeparture\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFD_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightplanupdate\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeFPU_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/flightplanupdate\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeFPU_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/planningstatus\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficePS_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/planningstatus\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficePS_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/preliminaryflightplan\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficePFP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/preliminaryflightplan\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficePFP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/submissionresponse\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeSR_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/submissionresponse\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeSR_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/trialrequest\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeTRQ_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/trialrequest\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeTRQ_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/trialresponse\/flight\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../../base/FficeTRP_Base.xsd\"/>\n";
      }
      elsif ($schema =~ /\/trialresponse\/fficemessage\//)
      {
        $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"../base/FficeTRP_Base.xsd\"/>\n";
      }
      else
      {
        $line = $match . "Base.xsd\"/>\n";
      }
      $$firstBaseImport = 0;
    }
    else
    {
      $skipLine = 1;
    }
  }
  elsif ($line =~ /<\/xs:schema>/)
  {
    # Add package imports to Fixm.xsd
    if ($schema =~ /\/Fixm.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/Flight.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to Base.xsd
    elsif ($schema =~ /\/Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./Address.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./AeronauticalReference.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./Extension.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./Measures.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./Organization.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./RangesAndChoices.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./Types.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./UnitOfMeasures.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to Flight.xsd
    elsif ($schema =~ /\/Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./aircraft/Aircraft.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./arrival/Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./capability/Capability.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./cargo/Cargo.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./emergency/Emergency.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./enroute/EnRoute.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FlightRouteTrajectory.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./rankedtrajectory/RankedTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to Cargo.xsd
    elsif ($schema =~ /\/Cargo.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./DangerousGoods.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./Packaging.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./RadioactiveMaterials.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FficeTemplates.xsd
    elsif ($schema =~ /\/FficeTemplates.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./FficeBase.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./FficeFlight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./filedflightplan/fficemessage/FficeFFP_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./filingstatus/fficemessage/FficeFS_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightarrival/fficemessage/FficeFA_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightcancellation/fficemessage/FficeFC_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdatarequest/fficemessage/FficeFDRQ_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdataresponse/fficemessage/FficeFDRP_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdeparture/fficemessage/FficeFD_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightplanupdate/fficemessage/FficeFPU_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./planningstatus/fficemessage/FficePS_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./preliminaryflightplan/fficemessage/FficePFP_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./submissionresponse/fficemessage/FficeSR_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./trialrequest/fficemessage/FficeTRQ_FficeMessage.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./trialresponse/fficemessage/FficeTRP_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeBase.xsd
    elsif ($schema =~ /\/FficeBase.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./filedflightplan/base/FficeFFP_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./filingstatus/base/FficeFS_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightarrival/base/FficeFA_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightcancellation/base/FficeFC_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdatarequest/base/FficeFDRQ_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdataresponse/base/FficeFDRP_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdeparture/base/FficeFD_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightplanupdate/base/FficeFPU_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./planningstatus/base/FficePS_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./preliminaryflightplan/base/FficePFP_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./submissionresponse/base/FficeSR_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./trialrequest/base/FficeTRQ_Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./trialresponse/base/FficeTRP_Base.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFlight.xsd
    elsif ($schema =~ /\/FficeFlight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./filedflightplan/flight/FficeFFP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./filingstatus/flight/FficeFS_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightarrival/flight/FficeFA_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightcancellation/flight/FficeFC_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdatarequest/flight/FficeFDRQ_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdataresponse/flight/FficeFDRP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdeparture/flight/FficeFD_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightplanupdate/flight/FficeFPU_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./planningstatus/flight/FficePS_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./preliminaryflightplan/flight/FficePFP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./submissionresponse/flight/FficeSR_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./trialrequest/flight/FficeTRQ_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./trialresponse/flight/FficeTRP_Flight.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FiledFlightPlan.xsd
    elsif ($schema =~ /\/FiledFlightPlan.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFFP_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFFP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFFP_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFFP_Base.xsd
    elsif ($schema =~ /\/FficeFFP_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFFP_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFFP_Flight.xsd
    elsif ($schema =~ /\/FficeFFP_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./aircraft/FficeFFP_Aircraft.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./arrival/FficeFFP_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeFFP_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./enroute/FficeFFP_EnRoute.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeFFP_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficeFFP_FlightRouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFFP_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficeFFP_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficeFFP_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFFP_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFFP_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FilingStatus.xsd
    elsif ($schema =~ /\/FilingStatus.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFS_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFS_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFS_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFS_Base.xsd
    elsif ($schema =~ /\/FficeFS_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFS_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFS_Flight.xsd
    elsif ($schema =~ /\/FficeFS_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./flightdata/FficeFS_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficeFS_FlightRouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFS_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficeFS_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficeFS_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFS_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFS_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FlightArrival.xsd
    elsif ($schema =~ /\/FlightArrival.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFA_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFA_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFA_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFA_Base.xsd
    elsif ($schema =~ /\/FficeFA_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFA_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFA_Flight.xsd
    elsif ($schema =~ /\/FficeFA_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficeFA_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeFA_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeFA_FlightData.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FlightCancellation.xsd
    elsif ($schema =~ /\/FlightCancellation.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFC_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFC_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFC_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFC_Base.xsd
    elsif ($schema =~ /\/FficeFC_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFC_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFC_Flight.xsd
    elsif ($schema =~ /\/FficeFC_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficeFC_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeFC_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeFC_FlightData.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FlightDataRequest.xsd
    elsif ($schema =~ /\/FlightDataRequest.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFDRQ_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFDRQ_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFDRQ_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFDRQ_Base.xsd
    elsif ($schema =~ /\/FficeFDRQ_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFDRQ_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFDRQ_Flight.xsd
    elsif ($schema =~ /\/FficeFDRQ_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficeFDRQ_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeFDRQ_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeFDRQ_FlightData.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FlightDataResponse.xsd
    elsif ($schema =~ /\/FlightDataResponse.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFDRP_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFDRP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFDRP_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFDRP_Base.xsd
    elsif ($schema =~ /\/FficeFDRP_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFDRP_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFDRP_Flight.xsd
    elsif ($schema =~ /\/FficeFDRP_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./flightdata/FficeFDRP_FlightData.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FlightDeparture.xsd
    elsif ($schema =~ /\/FlightDeparture.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFD_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFD_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFD_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFD_Base.xsd
    elsif ($schema =~ /\/FficeFD_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFD_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFD_Flight.xsd
    elsif ($schema =~ /\/FficeFD_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficeFD_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeFD_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeFD_FlightData.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to FlightPlanUpdate.xsd
    elsif ($schema =~ /\/FlightPlanUpdate.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeFPU_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeFPU_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeFPU_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFPU_Base.xsd
    elsif ($schema =~ /\/FficeFPU_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFPU_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFPU_Flight.xsd
    elsif ($schema =~ /\/FficeFPU_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficeFPU_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeFPU_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./enroute/FficeFPU_EnRoute.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeFPU_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficeFPU_FlightRouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeFPU_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficeFPU_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficeFPU_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFPU_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeFPU_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to PlanningStatus.xsd
    elsif ($schema =~ /\/PlanningStatus.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficePS_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficePS_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficePS_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficePS_Base.xsd
    elsif ($schema =~ /\/FficePS_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficePS_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficePS_Flight.xsd
    elsif ($schema =~ /\/FficePS_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./flightdata/FficePS_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficePS_FlightRouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficePS_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficePS_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficePS_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficePS_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficePS_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to PreliminaryFlightPlan.xsd
    elsif ($schema =~ /\/PreliminaryFlightPlan.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficePFP_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficePFP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficePFP_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficePFP_Base.xsd
    elsif ($schema =~ /\/FficePFP_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficePFP_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficePFP_Flight.xsd
    elsif ($schema =~ /\/FficePFP_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficePFP_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficePFP_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./enroute/FficePFP_EnRoute.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficePFP_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficePFP_FlightRouteTrajectory.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./rankedtrajectory/FficePFP_RankedTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficePFP_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficePFP_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficePFP_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficePFP_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficePFP_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to SubmissionResponse.xsd
    elsif ($schema =~ /\/SubmissionResponse.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeSR_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeSR_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeSR_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeSR_Base.xsd
    elsif ($schema =~ /\/FficeSR_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeSR_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeSR_Flight.xsd
    elsif ($schema =~ /\/FficeSR_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./flightdata/FficeSR_FlightData.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to TrialRequest.xsd
    elsif ($schema =~ /\/TrialRequest.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeTRQ_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeTRQ_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeTRQ_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeTRQ_Base.xsd
    elsif ($schema =~ /\/FficeTRQ_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeTRQ_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeTRQ_Flight.xsd
    elsif ($schema =~ /\/FficeTRQ_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./arrival/FficeTRQ_Arrival.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./departure/FficeTRQ_Departure.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./enroute/FficeTRQ_EnRoute.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightdata/FficeTRQ_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficeTRQ_FlightRouteTrajectory.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./rankedtrajectory/FficeTRQ_RankedTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeTRQ_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficeTRQ_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficeTRQ_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeTRQ_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeTRQ_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package imports/includes to TrialResponse.xsd
    elsif ($schema =~ /\/TrialResponse.xsd/)
    {
      $line = "\t<xs:import namespace=\"http://www.fixm.aero/base/4.2\" schemaLocation=\"./base/FficeTRP_Base.xsd\"/>\n" .
              "\t<xs:import namespace=\"http://www.fixm.aero/flight/4.2\" schemaLocation=\"./flight/FficeTRP_Flight.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./fficemessage/FficeTRP_FficeMessage.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeTRP_Base.xsd
    elsif ($schema =~ /\/FficeTRP_Base.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"../../../../../core/base/Base.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeTRP_Organization.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeTRP_Flight.xsd
    elsif ($schema =~ /\/FficeTRP_Flight.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./flightdata/FficeTRP_FlightData.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./flightroutetrajectory/FficeTRP_FlightRouteTrajectory.xsd\"/>\n" .
              $line;
    }
    # Add package-wide includes to FficeTRP_FlightRouteTrajectory.xsd
    elsif ($schema =~ /\/FficeTRP_FlightRouteTrajectory.xsd/)
    {
      $line = "\t<xs:include schemaLocation=\"./FficeTRP_Constraints.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeTRP_RouteChanges.xsd\"/>\n" .
              "\t<xs:include schemaLocation=\"./FficeTRP_RouteTrajectory.xsd\"/>\n" .
              $line;
    }
  }
  else
  {
    # Add "Type" to the end of all FIXM type names (both declaration and use)
    $line =~ s/<xs:(simple|complex)Type.*name="[^"]*/$&Type/;
    $line =~ s/<xs:(restriction|extension).*base="(fb|fx|msg|ffice):[^"]*/$&Type/;
    $line =~ s/<xs:(attribute|element).*type="(fb|fx|msg|ffice):[^"]*/$&Type/;
    $line =~ s/<xs:list.*itemType="(fb|fx|msg|ffice):[^"]*/$&Type/;
  }

  if ($line =~ /<xs:attribute /)
  {
    $$recordAttributeBlock = 1;
    $$sortAttributes = 0;
    push @$attributeBlock, $line;
    $skipLine = 1;
  }
  elsif ($line =~ /<\/xs:attribute>/)
  {
    $$recordAttributeBlock = 0;
    $$sortAttributes = 1;
    $attributeBlock->[-1] .= $line;
    $skipLine = 1;
  }
  elsif ($$recordAttributeBlock == 1)
  {
    $attributeBlock->[-1] .= $line;
    $skipLine = 1;
  }
  elsif ($$sortAttributes == 1)
  {
    $$sortAttributes = 0;
    my @sortedAttributeBlock = sort @$attributeBlock;
    foreach my $block (@sortedAttributeBlock)
    {
      print $out $block;
    }
    undef @$attributeBlock;
  }

  if ($skipLine == 0)
  {
    print $out $line;
  }

  return;
}

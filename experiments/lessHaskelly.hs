{-|
REDUCED SYNTAX Version


Some sample things to try and make ...

-------------------------------

Single Well

Cell Modem Polled Well Set

Elynx Well Definition

GCS Well

Schlumberger Well

------------------------------

I think having a setting like default Maybe makes a lot of sense.

* If DefaultOptional is turned on, then every field is actually assumed to be optional
  I think it also makes sense to make this the default.

  * So you would specify 'NoDefaultOptional' to turn it off

  * perhaps even a UseOptionalMaybe, UserOptionalEither or something like that in the future


* Stealing the typeclasses on Value in Data.Aeson leads me to some interesting stuff  

   Eq Value	 
   Data Value	 
   Show Value	 
   Typeable Value	 
   IsString Value	 
   NFData Value	 
   Hashable Value

  *  don't know about the hashable, NFData and IsString... but the rest of it I want for sure.

* RecordConstructors should be generated the same way they are in persistent
  * The type graph should be inferred based on the way these structures interlink
  * newtype wrappers should be generated for every primitive.


|-}


OnpingTagCombined = OnpingTagCombined {
  location_id             ::   LocationId 
  ,slave_parameter_id     ::   Int   
  ,parameter_tag_id       ::   Int   
  ,description            ::   Text    
  ,unit_id                ::   Int    
  ,status_active          ::   Int    
  ,status_writable        ::   Int   
  ,last_update            ::   UTCTime 
  ,result                 ::   Text  
  ,validation_code        ::   Text  
  ,permissions            ::   Int   
  ,delete                 ::   Int   
  ,companyIdRef	          ::   CompanyIdRef  
  ,siteIdRef              ::   SiteIdRef   
  ,location		  ::   Location
  ,pid		      	  ::   Int 
}

Location = Location { 
   siteIdRef    :: Int
  ,slaveId      :: Int 
  ,refId        :: Int -
  ,name         :: Text 
  ,url          :: Text 
  ,delete       :: Int
  ,companyIdRef :: Int
   
  }



-- Drill down constraints only... no "many's"
-- Violating this rule will produce an error

GCSDevice = GCSDevice {
      well                      :: Location                        | LocationCompanyId == 6
     ,tankBattery               :: Loation                         | LocationCompanyId == 6
     ,activeTankLevel           :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 30  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,transferDischargePressure :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 31  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,runStatus                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 32  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,operatingFrequency        :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 33  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,aPhaseOut                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 34  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bPhaseOut                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 35  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,cPhaseOut                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 36  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,abInput                   :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 37  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bcInput                   :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 38  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,caInput                   :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 39  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bhp                       :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 310 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bht                       :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 311 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,tubing                    :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 312 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,casing                    :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 313 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,flowRate                  :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 4   , OnpingTagCombinedLocationId == GCSTankBatteryRefId
      previousDayFlowRate       :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 3   , OnpingTagCombinedLocationId == GCSTankBatteryRefId
}

     
SchlumbergerDevice = SchlumbergerDevice {
     ,well                      :: Location                        | LocationCompanyId == 6
     ,tankBattery               :: Loation                         | LocationCompanyId == 6
     ,activeTankLevel           :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 0  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,transferDischargePressure :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 1  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,runStatus                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 2  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,operatingFrequency        :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 3  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,aPhaseOut                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 4  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bPhaseOut                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 5  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,cPhaseOut                 :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 6  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,abInput                   :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 7  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bcInput                   :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 8  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,caInput                   :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 9  , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bhp                       :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 10 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,bht                       :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 11 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,tubing                    :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 12 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,casing                    :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 13 , OnpingTagCombinedLocationId == GCSDeviceWellRefId
     ,flowRate                  :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 4  , OnpingTagCombinedLocationId == GCSTankBatteryRefId
      previousDayFlowRate       :: OnpingTagCombinedParameterTagId | OnpingTagCombinedParameterTagId == 3  , OnpingTagCombinedLocationId == GCSTankBatteryRefId
}



ElynxWellFlowRate       = ElynxWellFlowRate1 { gcs::GCSDeviceFlowRate}     | ElynxWellFlowRate2 { schlumberger::SchlumbergerFlowRate }
ElynxWellCasingPressure = ElynxWellCasingPressure1 {gcs::GCSDeviceCasing} | ElynxWellCasingPressure2 {schlumberger::SchlumbergerDeviceCasing}

ElynxWell = ElynxWell {
  flowRate :: ElynxWellFlowRate
  ,casingPressure :: ElynxWellCasingPressure
  }


----------------------------------------------------------------------------------------------------
-- | Possible Generated Code
----------------------------------------------------------------------------------------------------

-- | Helper types

data FieldConstraint a b = FieldConstraint {
   accessor :: a -> b
 , constraint :: b }

-- | Constrained type construction

constructType someType constraint

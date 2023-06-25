workspace "Truck In" "Asignación de Servicio de Transporte" {

    !impliedRelationships "false" 
    !identifiers "hierarchical" 

    model {
        
        Driver = person "Driver" "Search a  job as a driver" "Driver" 
        TransportManager = person "TransportManager" "Driver Recruiter" "Transport Manager" 
        
        
        TRUCKIN = softwareSystem "TRUCK IN" "Transportation Service Assignment" "TRUCK IN" {
            BD = container "BD" "Data Base" "Oracle 12C 1521" "Oracle"  {
                Registration = component "RegistrationContext"
                DriverSearch = component "DriverSearch Context" 
            }
            
           
            API = container "Truck In API" "Wildlfy 18" "JEE 8080" "Wildlfy" {
                //Motordeflujo = component "Flow Engine" "" "Java  EE" "Componente" 
                //GestordeFormularios = component "Forms Manager" "Forms" "Java JEE" "Componente" 
                //WebService = component "Web Service" "WS Incidente" "REST" "rest" 
                //ConectorExterno = component "External conector" "OEFA-OSINERGMIN" "" "Componente" 
                //ConectorBD = component "Conector BD" "Conector BD" "" "Componente" 
                
                TruckInService = component "TruckInService"
                
                //Nuestro API tambien con todos los modulos 
                PostulationRepo = component "Postulation Context "
                DriverSearchRepo = component "Driver Search Context "
                TripRepo = component "Trip Assignment Context"
                HandlingRepo = component "Handling Context"
                ReviewRepo = component "Review Context"
                PaymentRepo = component "Payment Context"
                IdentityRepo = component "Identity & Access Management Context"
                ProfileRepo = component "Profile Validation Context"
            }
            MobileAPP = container "MobileAPP"{
                Postulation = component "Postulation Context "
                DriverSearch = component "Driver Search Context "
                Trip = component "Trip Assignment Context"
                Handling = component "Handling Context"
                Review = component "Review Context"
                Payment = component "Payment Context"
                Identity = component "Identity & Access Management Context"
                Profile = component "Profile Validation Context"
                //Si interactua con todos los modulos el Moblie APP
            }
        }
        
        GM = softwareSystem "Google Maps" "Used for real time location." "GOOGLE MAPS" 
         
        RENIEC = softwareSystem "RENIEC" "Used for validate identity of users" "RENIEC" 
        
        

        GM -> TRUCKIN "Update and follow up " "Mobile" 
        
        
        TRUCKIN -> RENIEC "reports" 
        TRUCKIN.API -> TRUCKIN.BD "Read and write" 
        Driver -> TRUCKIN.MobileAPP "Search, filter, public and update" 
        TransportManager -> TRUCKIN.MobileAPP "Search, filter, public and update" 
        
        TRUCKIN.API -> RENIEC "Update" 
        GM -> TRUCKIN.API "Read and update" 
        
        
        TRUCKIN.MobileAPP -> TRUCKIN.API "Update" 
        Driver -> TRUCKIN "Publish their services as a drivers" "Mobile" 
        TransportManager -> TRUCKIN "Search drivers that meet their expectations" "Mobile" 
        
        Driver -> TRUCKIN.MobileAPP.Postulation "Uses" 
        Driver -> TRUCKIN.MobileAPP.DriverSearch "Uses"
        Driver -> TRUCKIN.MobileAPP.Trip "Uses"
        Driver -> TRUCKIN.MobileAPP.Handling "Uses" 
        Driver -> TRUCKIN.MobileAPP.Review "Uses" 
        Driver -> TRUCKIN.MobileAPP.Payment "Uses" 
        Driver -> TRUCKIN.MobileAPP.Identity "Uses" 
        Driver -> TRUCKIN.MobileAPP.Profile "Uses"
        
        TransportManager -> TRUCKIN.MobileAPP.Postulation "Uses"
        TransportManager -> TRUCKIN.MobileAPP.DriverSearch "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.Trip "Uses"
        TransportManager -> TRUCKIN.MobileAPP.Handling "Uses"
        TransportManager -> TRUCKIN.MobileAPP.Review "Uses"  
        TransportManager -> TRUCKIN.MobileAPP.Payment "Uses"
        TransportManager -> TRUCKIN.MobileAPP.Identity "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.Profile "Uses"
        
        
        TRUCKIN.MobileAPP.Postulation   -> TRUCKIN.BD
        TRUCKIN.MobileAPP.DriverSearch  -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Trip          -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Handling      -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Review        -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Payment       -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Identity      -> TRUCKIN.BD 
        TRUCKIN.MobileAPP.Profile       -> TRUCKIN.BD 
        
        TRUCKIN.API.TruckInService -> TRUCKIN.API.PostulationRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.DriverSearchRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.TripRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.HandlingRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.ReviewRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.PaymentRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.IdentityRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.ProfileRepo
        
        TRUCKIN.API.PostulationRepo     -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.DriverSearchRepo    -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.TripRepo            -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.HandlingRepo        -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.ReviewRepo          -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.PaymentRepo         -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.IdentityRepo        -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.ProfileRepo         -> TRUCKIN.BD "Read from and write to"
        
        TRUCKIN.BD.DriverSearch -> TRUCKIN.API "Give Information"
        TRUCKIN.BD.Registration -> TRUCKIN.API "Set and Give Information"
    }

    views {
        systemContext TRUCKIN "Contexto" "Diagrama de contexto" {
            include *
           
        }

        container TRUCKIN "Contenedores" "Vista de contenedores QSHE" {
            include *
            
        
        }

        component TRUCKIN.MobileAPP "Container" {
            include *
            
        }
        component TRUCKIN.API "Container2" {
            include *
            
        }

        
        styles {
            
            element "Oracle" {
                shape "Cylinder" 
                background "#ec0e0e" 
                color "#ffffff" 
            }
            element "Person" {
                shape "Person" 
                background "#232ecd" 
                color "#ffffff" 
            }
            element "TRUCKIN" {
                shape "RoundedBox" 
                background "#d49816" 
            }
            element "MobileAPP"{
                shape "RoundedBox" 
                background "#d49816" 
            }
            
            element "Container2"{
               shape "RoundedBox" 
                background "#d49816" 
            }
        }

    }

}
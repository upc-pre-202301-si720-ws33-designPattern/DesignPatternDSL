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
                RegistrationRepo = component "Registration Context "
                DriverSearchRepo = component "DriverSearch Context "
                AssignamentAgreementRepo = component "AssignmentAgreement Context"
                AssignamentManagementRepo = component "AssignmentManagementContext"
                ReviewFeedbackRepo = component "Review&Feedback Context"
                ComunicationRepo = component "Comunication Context"
            }
            MobileAPP = container "MobileAPP"{
                Registration = component "RegistrationContext"
                DriverSearch = component "DriverSearch Context"
                AssignamentAgreement = component "Assignment Agreement Context"
                AssignamentManagement = component "Assignment Management Context"
                ReviewFeedback = component "Review&Feedback Context"
                Comunication = component "Comunication Context" 
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
        
        Driver -> TRUCKIN.MobileAPP.Registration "Uses" 
        Driver -> TRUCKIN.MobileAPP.DriverSearch "Uses" 
        Driver -> TRUCKIN.MobileAPP.AssignamentAgreement "Uses" 
        Driver -> TRUCKIN.MobileAPP.AssignamentManagement "Uses" 
        Driver -> TRUCKIN.MobileAPP.ReviewFeedback "Uses" 
        Driver -> TRUCKIN.MobileAPP.Comunication "Uses" 
        
        TransportManager -> TRUCKIN.MobileAPP.Registration "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.DriverSearch "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.AssignamentAgreement "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.AssignamentManagement "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.ReviewFeedback "Uses" 
        TransportManager -> TRUCKIN.MobileAPP.Comunication "Uses"
        
        TRUCKIN.MobileAPP.AssignamentManagement -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Registration -> TRUCKIN.BD
        TRUCKIN.MobileAPP.DriverSearch -> TRUCKIN.BD
        TRUCKIN.MobileAPP.AssignamentAgreement -> TRUCKIN.BD
        TRUCKIN.MobileAPP.ReviewFeedback -> TRUCKIN.BD
        TRUCKIN.MobileAPP.Comunication -> TRUCKIN.BD 
        
        TRUCKIN.API.TruckInService -> TRUCKIN.API.RegistrationRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.DriverSearchRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.AssignamentAgreementRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.AssignamentManagementRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.ReviewFeedbackRepo
        TRUCKIN.API.TruckInService -> TRUCKIN.API.ComunicationRepo
        
        TRUCKIN.API.RegistrationRepo -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.DriverSearchRepo -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.AssignamentAgreementRepo -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.AssignamentManagementRepo -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.ReviewFeedbackRepo -> TRUCKIN.BD "Read from and write to"
        TRUCKIN.API.ComunicationRepo -> TRUCKIN.BD "Read from and write to"
        
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

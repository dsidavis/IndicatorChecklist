
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
   
  # Application title
  headerPanel("Prototype of Checklist Generator Prototype"),  #?? Prototype needed twice?
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
     actionButton("uncheckBtn", "Uncheck All", onclick="uncheckAll(false);"),
     actionButton("check", "Check All", onclick="uncheckAll(true);"),
     tabsetPanel(
          tabPanel("Alphabetical", checkboxGroupInput("issuevect", label = NULL, choices = (integrateds), selected = integrateds)),
                 
         tabPanel("Grouped",
#             do.call(wellPanel,
#unlist( lapply(split(data.frame(issues = integrateds, groups = groups, stringsAsFactors = FALSE), groups),
#                           function(d) {
#                             titlePanel(d$groups[1])
#                      #            checkboxGroupInput(paste0("issuevect", d$groups[1]), label = NULL, choices = d$issues))
#                           }), recursive = FALSE)
#                     )
                  #!!! Really want to do this with a call to by(), but that doesn't seem to work.
                  # Shiny is either using state across calls to collect the HTML content (!), or using non-standard evaluation!
                  # Or both!
                   wellPanel(titlePanel("Impact"),
                             checkboxGroupInput("issuevectImpact", label = NULL, choices = integrateds[groups == "Impact"]),
                             titlePanel("Vulnerability"),
                             checkboxGroupInput("issuevectVulnerability", label = NULL, choices = integrateds[groups == "Vulnerability"]),                             
                             titlePanel("Capital 1"),
                             checkboxGroupInput("issuevectCapital1", label = NULL, choices = integrateds[ groups == "Capital 1"]),
                             titlePanel("Capital 2"),
                             checkboxGroupInput("issuevectCapital1", label = NULL, choices = integrateds[ groups == "Capital 2"]),
                             titlePanel("Capital 3"),
                             checkboxGroupInput("issuevectCapital1", label = NULL, choices = integrateds[ groups == "Capital 3"]),
                             titlePanel("Capital 4"),
                             checkboxGroupInput("issuevectCapital1", label = NULL, choices = integrateds[ groups == "Capital 4"]),
                             titlePanel("Capital 5"),
                             checkboxGroupInput("issuevectCapital1", label = NULL, choices = integrateds[ groups == "Capital 5"]),
                             titlePanel("Capital 6"),
                             checkboxGroupInput("issuevectCapital1", label = NULL, choices = integrateds[ groups == "Capital 6"])                             
                            )
                  )
      )
   ),
                                          # formerly issues2 ^
  # Show a text list of indicators
  mainPanel(
    submitButton(text="Calculate Checklist"),      
    tableOutput("indicatorResults"),
    textInput("requireds", "Required Indicators"),
    textInput("excludeds", "Excluded Indicators"),
    textOutput("foo"),
    textOutput("exOut"),
    tags$head(tags$script(src = "checkboxes.js")),
    tags$head(tags$script(src = "xpath.js")),
    tags$script("getCheckboxes(); uncheckAll(true);")
      
  )
))

# run with runApp("~/ASI/checklist/shiny")

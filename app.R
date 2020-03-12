#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "点数の間隔:",
                        min = 1,
                        max = 10,
                        value = 5)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        sales_persons <- c("A","B","C","D","E","F","G","H","I","J","K","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","AA","AB","AC","AD","AE","AF","AG","AH","AI")
        sales_result <- c(2,1,0,6,7,20,8,4,2,15,11,6,3,3,17,17,6,4,2,0,1,7,2,3,4,10,11,4,15,5,3,14,4,5,6,12,3)
        test_sales_result <- rbind(sales_persons,sales_result)
        x <- sales_result
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgrey', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

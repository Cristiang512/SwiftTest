#  Swift Test

###explanation of files and views

#TestApp
Is the main of the application where the principal view is executed

##ContentView
In this view all the todo's of the public api are listed from the LaunchDataFetcher file

##LaunchDataFetcher
In this file the request to the api is generated and this data is sent to the Contentview

##ListDetailView
In this view the details of each todo's are shown and the associated comments are listed

##LaunchDataFetcherComment
In this file the request to the comments api is generated and this data is sent to the ListDetailView


###impediments
I had trouble sending the id from ListDetailView to LaunchDataFetcherComment. what I did was burn the id and thus verify that the request to the api was correct


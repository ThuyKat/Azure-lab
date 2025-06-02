# mslearn-knowledge-mining
Lab files for Azure AI Knowledge Mining modules
1. Azure search
This lab we learn how to manually config AI search (which is different to RAG lab we use oepnAI embedding model!) which include config dataset, index, skillset, indexer. 
STEP 1: Create AI Search, AI Services, Blog Storage Account
STEP 2: Add values to variable in command file to upload data to the storage account
STEP 3: Sign in az login > change mode "chmod +x UploadDocs.sh" > run the command
STEP 4: Go to AI search resource > import data > pay attention to the connection string where we create connection between search service and the blob storage (existing connection)
![alt text](aisearch1.png)
STEP 5: Add skillset
![alt text](aisearch2.png)
STEP 6: Customize target index
![alt text](aisearch3.png)
![alt text](aisearch4.png)
STEP 7: Create indexer
![alt text](aisearch5.png)
STEP 8: run the indexer
![alt text](aisearch6.png)
STEP 9: Explorer
![alt text](aisearch7.png)
STEP 10: Modify search from local app with new definition of skillset, index, indexer
Test with Explorer: 
![alt text](aisearch8.png)
STEP 11: Install azure-search SDK and run code file
pip install azure-search-documents==11.5.1
flash run
STEP 12: Test the search website
![alt text](aisearch9.png)
![alt text](aisearch10.png)

2. Add custom skill

STEP 1: create AI services resource
STEP 2: run the script which do the following task:
    - Create a random unique id number
    - Create storage account whose name is ai102str${unique_id}
    - Get the storage key
    - Create a container inside the storage name "margies" with public access
    - Upload data from "data\" folder to "margies" container
    - Create a search service name ai102srch${unique_id} 
    - Show connection details to connect other apps: URL, admin keys, query keys
Verify if services are created successfully on the azure portal: 
![alt text](customskill1.png)
STEP 3: Create a search solution
    - Run the script to crate datasource, skillset, index, indexer
STEP 4: Create function app for custom skill
    - Create Function App resource
    - Create function which extract key words, count and sort them with most frequent words on top
    - Test the function
    - Get the function URL
STEP 5: In the update_skillset file, add the custom skillset ontop of the old skillset, paste in the uri of function countword
STEP 6: Add an additional field named top_words at the bottom of the index definition in update index file
STEP 7: Add additional mapping for top_words in update indexer file
STEP 8: Run the script to update all search config 
STEP 9: Open indexer and confirm if the update is success > Test on Search explorer
![alt text](customskill2.png)
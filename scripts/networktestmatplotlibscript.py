import matplotlib.pyplot as graph
# method to read file data lines
def networklatencydata(path):
    domainNames = []
    avgValues = []
   
    with open(path, 'r') as file:
        for line in file:
            domain, avg = line.strip().split()
            domainNames.append(domain)
            avgValues.append(float(avg))
   
    return domainNames, avgValues
# method to generate graph between domain names and average RTT
def generategraph(domainNames, avgValues):
    graph.plot(domainNames, avgValues, color='red')
    graph.xlabel('Domains')
    graph.ylabel('Average Round Trip Time (ms)')
    graph.title('Network Latency Test Graph')
    graph.xticks(rotation=45, ha='right')
    graph.tight_layout()
    graph.show()

if __name__ == "__main__":
    path = "network-test-latency.txt"
    try:
        domainNames, avgValues = networklatencydata(path) 
        generategraph(domainNames, avgValues)
    except Exception as e:
        print(f"Error: {e}")

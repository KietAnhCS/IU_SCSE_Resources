from urllib.request import urlopen
from bs4 import BeautifulSoup

articleURL = "http://curia.europa.eu/juris/document/document.jsf?text=&docid=139407&pageIndex=0&doclang=EN&mode=lst&dir=&occ=first&part=1&cid=52454"

def getText(url):
    page = urlopen(url).read().decode('utf8', 'ignore')
    soup = BeautifulSoup(page, 'lxml')
    text = ' '.join(map(lambda p: p.text, soup.find_all('p')))
    return text.encode('ascii', errors='replace').decode().replace("?","")

text = getText(articleURL)




import nltk
# nltk.download('punkt')
# nltk.download()
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from nltk.probability import FreqDist
from collections import defaultdict
from string import punctuation
from heapq import nlargest

def summarize(text, n):
    sents = sent_tokenize(text)
    
    assert n <= len(sents)
    wordSent = word_tokenize(text.lower())
    stopWords = set(stopwords.words('english')+list(punctuation))
    
    wordSent= [word for word in wordSent if word not in stopWords]
    freq = FreqDist(wordSent)

    ranking = defaultdict(int)
    
    for i, sent in enumerate(sents):
        for w in word_tokenize(sent.lower()):
            if w in freq:
                ranking[i] += freq[w]

    sentsIDX = nlargest(n, ranking, key=ranking.get)
    return [sents[j] for j in sorted(sentsIDX)]

summaryArr = summarize(text, 10)
# summaryArr



from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
import numpy as np

vectorizer = TfidfVectorizer(max_df=0.5,min_df=2,stop_words='english')
X = vectorizer.fit_transform(summaryArr)
km = KMeans(n_clusters = 3, init = 'k-means++', max_iter = 100, n_init = 1, verbose = True)
km.fit(X)
np.unique(km.labels_, return_counts=True)

text={}
for i,cluster in enumerate(km.labels_):
    oneDocument = summaryArr[i]
    if cluster not in text.keys():
        text[cluster] = oneDocument
    else:
        text[cluster] += oneDocument

stopWords = set(stopwords.words('english')+list(punctuation))
keywords = {}
counts={}

for cluster in range(3):
    word_sent = word_tokenize(text[cluster].lower())
    word_sent=[word for word in word_sent if word not in stopWords]
    freq = FreqDist(word_sent)
    keywords[cluster] = nlargest(100, freq, key=freq.get)
    counts[cluster]=freq

uniqueKeys={}
for cluster in range(3):   
    other_clusters=list(set(range(3))-set([cluster]))
    keys_other_clusters=set(keywords[other_clusters[0]]).union(set(keywords[other_clusters[1]]))
    unique=set(keywords[cluster])-keys_other_clusters
    uniqueKeys[cluster]=nlargest(10, unique, key=counts[cluster].get)

print(uniqueKeys)
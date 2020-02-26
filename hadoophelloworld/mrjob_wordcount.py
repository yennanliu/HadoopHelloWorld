from mrjob.job import MRJob
from mrjob.step import MRStep
import re 

WORD_RE = re.compile(r"[\w']+")


def print_ingest_data():
    with open("README.md") as f:
        for i in f:
            print (WORD_RE.findall(i))

class MRWordCount(MRJob):

    def steps(self):
        return [ 
            MRStep(mapper = self.mapper_get_words,
                   combiner = self.combiner_count_words,
                   reducer = self.reducer_count_words),
            #MRStep(reducer = self.reducer_find_max_word)        
            ]

    def mapper_get_words(self, _, line):
        # yield each word in the line 
        for word in WORD_RE.findall(line):
            yield (word.lower(), 1)

    def combiner_count_words(self, word, counts):
        # optimization : sum the words seen so far 
        yield (word, sum(counts))

    def reducer_count_words(self, word, counts):
        # send all (num_occurrences, word) pairs to the same reducer
        # num_occurrences, then we can use max() function 
        yield None, (sum(counts), word)

    def reducer_find_max_word(self, _, word_count_pairs):
        yield max(word_count_pairs)


if __name__ == '__main__':
    MRWordCount().run()

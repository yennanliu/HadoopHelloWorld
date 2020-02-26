from mrjob.job import MRJob
from mrjob.step import MRStep


class MROrderSum(MRJob):

    def prompt_msg(self):

        print ("""
                * Please run the command with dataset : data/customer-orders.csv
                * With the command : 
                $ python hadoophelloworld/mrjob_OrderSum.py  data/customer-orders.csv

              """)

    def steps(self):
        return [ 
            MRStep(mapper = self.mapper_get_order,
                   combiner = self.combiner_sum_orders,
                   reducer = self.reducer_sum_orders)
                ]

    def mapper_get_order(self, _, line):
        line_field = line.split(",")
        customer_id = line_field[0]
        order_amount = float(line_field[1])
        yield (customer_id, order_amount)

    def combiner_sum_orders(self, customer_id, order_amount):
        # optimization : sum the words seen so far 
        yield (customer_id, sum(order_amount))

    def reducer_sum_orders(self, customer_id, order_amount):
        # send all (num_occurrences, word) pairs to the same reducer
        # num_occurrences, then we can use max() function 
        yield None, (sum(order_amount), customer_id)

if __name__ == '__main__':
    try:
        MROrderSum().run()
    except Exception as e:
        print (e)
        MROrderSum().prompt_msg()

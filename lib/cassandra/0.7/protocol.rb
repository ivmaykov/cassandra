class Cassandra
  # Inner methods for actually doing the Thrift calls
  module Protocol #:nodoc:
    def _multi_count_columns(column_family, keys, super_column, start, finish, count, consistency)
      client.multiget_count([keys].flatten,
        CassandraThrift::ColumnParent.new(:column_family => column_family, :super_column => super_column),
        CassandraThrift::SlicePredicate.new(:slice_range =>
                                            CassandraThrift::SliceRange.new(
                                              :start  => start  || '',
                                              :finish => finish   || '',
                                              :count  => count  || 100
                                            )),
        consistency
      )
    end
  end
end

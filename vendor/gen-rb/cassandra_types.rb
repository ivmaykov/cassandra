#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module CassandraThrift
    module ConsistencyLevel
      ZERO = 0
      ONE = 1
      QUORUM = 2
      ALL = 3
      VALUE_MAP = {0 => "ZERO", 1 => "ONE", 2 => "QUORUM", 3 => "ALL"}
      VALID_VALUES = Set.new([ZERO, ONE, QUORUM, ALL]).freeze
    end

    class Column
      include ::Thrift::Struct
      NAME = 1
      VALUE = 2
      TIMESTAMP = 3

      ::Thrift::Struct.field_accessor self, :name, :value, :timestamp
      FIELDS = {
        NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
        VALUE => {:type => ::Thrift::Types::STRING, :name => 'value'},
        TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp'}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field name is unset!') unless @name
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field value is unset!') unless @value
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field timestamp is unset!') unless @timestamp
      end

    end

    class SuperColumn
      include ::Thrift::Struct
      NAME = 1
      COLUMNS = 2

      ::Thrift::Struct.field_accessor self, :name, :columns
      FIELDS = {
        NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
        COLUMNS => {:type => ::Thrift::Types::LIST, :name => 'columns', :element => {:type => ::Thrift::Types::STRUCT, :class => CassandraThrift::Column}}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field name is unset!') unless @name
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field columns is unset!') unless @columns
      end

    end

    class ColumnOrSuperColumn
      include ::Thrift::Struct
      COLUMN = 1
      SUPER_COLUMN = 2

      ::Thrift::Struct.field_accessor self, :column, :super_column
      FIELDS = {
        COLUMN => {:type => ::Thrift::Types::STRUCT, :name => 'column', :class => CassandraThrift::Column, :optional => true},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRUCT, :name => 'super_column', :class => CassandraThrift::SuperColumn, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

    end

    class NotFoundException < ::Thrift::Exception
      include ::Thrift::Struct

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

    end

    class InvalidRequestException < ::Thrift::Exception
      include ::Thrift::Struct
      def initialize(message=nil)
        super()
        self.why = message
      end

      def message; why end

      WHY = 1

      ::Thrift::Struct.field_accessor self, :why
      FIELDS = {
        WHY => {:type => ::Thrift::Types::STRING, :name => 'why'}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field why is unset!') unless @why
      end

    end

    class UnavailableException < ::Thrift::Exception
      include ::Thrift::Struct

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

    end

    class ColumnParent
      include ::Thrift::Struct
      COLUMN_FAMILY = 3
      SUPER_COLUMN = 4

      ::Thrift::Struct.field_accessor self, :column_family, :super_column
      FIELDS = {
        COLUMN_FAMILY => {:type => ::Thrift::Types::STRING, :name => 'column_family'},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRING, :name => 'super_column', :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field column_family is unset!') unless @column_family
      end

    end

    class ColumnPath
      include ::Thrift::Struct
      COLUMN_FAMILY = 3
      SUPER_COLUMN = 4
      COLUMN = 5

      ::Thrift::Struct.field_accessor self, :column_family, :super_column, :column
      FIELDS = {
        COLUMN_FAMILY => {:type => ::Thrift::Types::STRING, :name => 'column_family'},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRING, :name => 'super_column', :optional => true},
        COLUMN => {:type => ::Thrift::Types::STRING, :name => 'column', :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field column_family is unset!') unless @column_family
      end

    end

    class SliceRange
      include ::Thrift::Struct
      START = 1
      FINISH = 2
      REVERSED = 3
      COUNT = 4

      ::Thrift::Struct.field_accessor self, :start, :finish, :reversed, :count
      FIELDS = {
        START => {:type => ::Thrift::Types::STRING, :name => 'start'},
        FINISH => {:type => ::Thrift::Types::STRING, :name => 'finish'},
        REVERSED => {:type => ::Thrift::Types::BOOL, :name => 'reversed', :default => false},
        COUNT => {:type => ::Thrift::Types::I32, :name => 'count', :default => 100}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field start is unset!') unless @start
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field finish is unset!') unless @finish
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field reversed is unset!') if @reversed.nil?
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field count is unset!') unless @count
      end

    end

    class SlicePredicate
      include ::Thrift::Struct
      COLUMN_NAMES = 1
      SLICE_RANGE = 2

      ::Thrift::Struct.field_accessor self, :column_names, :slice_range
      FIELDS = {
        COLUMN_NAMES => {:type => ::Thrift::Types::LIST, :name => 'column_names', :element => {:type => ::Thrift::Types::STRING}, :optional => true},
        SLICE_RANGE => {:type => ::Thrift::Types::STRUCT, :name => 'slice_range', :class => CassandraThrift::SliceRange, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

    end

  end
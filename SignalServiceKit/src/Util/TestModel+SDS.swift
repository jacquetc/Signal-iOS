//
//  Copyright (c) 2020 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDB
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Record

public struct TestModelRecord: SDSRecord {
    public weak var delegate: SDSRecordDelegate?

    public var tableMetadata: SDSTableMetadata {
        return TestModelSerializer.table
    }

    public static let databaseTableName: String = TestModelSerializer.table.tableName

    public var id: Int64?

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    public let recordType: SDSRecordType
    public let uniqueId: String

    // Properties
    public let dateValue: Double?
    public let doubleValue: Double
    public let floatValue: Float
    public let int64Value: Int64
    public let nsIntegerValue: Int
    public let nsNumberValueUsingInt64: Int64?
    public let nsNumberValueUsingUInt64: UInt64?
    public let nsuIntegerValue: UInt
    public let uint64Value: UInt64

    public enum CodingKeys: String, CodingKey, ColumnExpression, CaseIterable {
        case id
        case recordType
        case uniqueId
        case dateValue
        case doubleValue
        case floatValue
        case int64Value
        case nsIntegerValue
        case nsNumberValueUsingInt64
        case nsNumberValueUsingUInt64
        case nsuIntegerValue
        case uint64Value
    }

    public static func columnName(_ column: TestModelRecord.CodingKeys, fullyQualified: Bool = false) -> String {
        return fullyQualified ? "\(databaseTableName).\(column.rawValue)" : column.rawValue
    }

    public func didInsert(with rowID: Int64, for column: String?) {
        guard let delegate = delegate else {
            owsFailDebug("Missing delegate.")
            return
        }
        delegate.updateRowId(rowID)
    }
}

// MARK: - Row Initializer

public extension TestModelRecord {
    static var databaseSelection: [SQLSelectable] {
        return CodingKeys.allCases
    }

    init(row: Row) {
        id = row[0]
        recordType = row[1]
        uniqueId = row[2]
        dateValue = row[3]
        doubleValue = row[4]
        floatValue = row[5]
        int64Value = row[6]
        nsIntegerValue = row[7]
        nsNumberValueUsingInt64 = row[8]
        nsNumberValueUsingUInt64 = row[9]
        nsuIntegerValue = row[10]
        uint64Value = row[11]
    }
}

// MARK: - StringInterpolation

public extension String.StringInterpolation {
    mutating func appendInterpolation(testModelColumn column: TestModelRecord.CodingKeys) {
        appendLiteral(TestModelRecord.columnName(column))
    }
    mutating func appendInterpolation(testModelColumnFullyQualified column: TestModelRecord.CodingKeys) {
        appendLiteral(TestModelRecord.columnName(column, fullyQualified: true))
    }
}

// MARK: - Deserialization

// TODO: Rework metadata to not include, for example, columns, column indices.
extension TestModel {
    // This method defines how to deserialize a model, given a
    // database row.  The recordType column is used to determine
    // the corresponding model class.
    class func fromRecord(_ record: TestModelRecord) throws -> TestModel {

        guard let recordId = record.id else {
            throw SDSError.invalidValue
        }

        switch record.recordType {
        case .testModel:

            let uniqueId: String = record.uniqueId
            let dateValueInterval: Double? = record.dateValue
            let dateValue: Date? = SDSDeserialization.optionalDoubleAsDate(dateValueInterval, name: "dateValue")
            let doubleValue: Double = record.doubleValue
            let floatValue: Float = record.floatValue
            let int64Value: Int64 = record.int64Value
            let nsIntegerValue: Int = record.nsIntegerValue
            let nsNumberValueUsingInt64: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.nsNumberValueUsingInt64, name: "nsNumberValueUsingInt64", conversion: { NSNumber(value: $0) })
            let nsNumberValueUsingUInt64: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.nsNumberValueUsingUInt64, name: "nsNumberValueUsingUInt64", conversion: { NSNumber(value: $0) })
            let nsuIntegerValue: UInt = record.nsuIntegerValue
            let uint64Value: UInt64 = record.uint64Value

            return TestModel(grdbId: recordId,
                             uniqueId: uniqueId,
                             dateValue: dateValue,
                             doubleValue: doubleValue,
                             floatValue: floatValue,
                             int64Value: int64Value,
                             nsIntegerValue: nsIntegerValue,
                             nsNumberValueUsingInt64: nsNumberValueUsingInt64,
                             nsNumberValueUsingUInt64: nsNumberValueUsingUInt64,
                             nsuIntegerValue: nsuIntegerValue,
                             uint64Value: uint64Value)

        default:
            owsFailDebug("Unexpected record type: \(record.recordType)")
            throw SDSError.invalidValue
        }
    }
}

// MARK: - SDSModel

extension TestModel: SDSModel {
    public var serializer: SDSSerializer {
        // Any subclass can be cast to it's superclass,
        // so the order of this switch statement matters.
        // We need to do a "depth first" search by type.
        switch self {
        default:
            return TestModelSerializer(model: self)
        }
    }

    public func asRecord() throws -> SDSRecord {
        return try serializer.asRecord()
    }

    public var sdsTableName: String {
        return TestModelRecord.databaseTableName
    }

    public static var table: SDSTableMetadata {
        return TestModelSerializer.table
    }
}

// MARK: - DeepCopyable

extension TestModel: DeepCopyable {

    public func deepCopy() throws -> AnyObject {
        // Any subclass can be cast to it's superclass,
        // so the order of this switch statement matters.
        // We need to do a "depth first" search by type.
        guard let id = self.grdbId?.int64Value else {
            throw OWSAssertionError("Model missing grdbId.")
        }

        do {
            let modelToCopy = self
            assert(type(of: modelToCopy) == TestModel.self)
            let uniqueId: String = modelToCopy.uniqueId
            let dateValue: Date? = modelToCopy.dateValue
            let doubleValue: Double = modelToCopy.doubleValue
            let floatValue: Float = modelToCopy.floatValue
            let int64Value: Int64 = modelToCopy.int64Value
            let nsIntegerValue: Int = modelToCopy.nsIntegerValue
            let nsNumberValueUsingInt64: NSNumber? = modelToCopy.nsNumberValueUsingInt64
            let nsNumberValueUsingUInt64: NSNumber? = modelToCopy.nsNumberValueUsingUInt64
            let nsuIntegerValue: UInt = modelToCopy.nsuIntegerValue
            let uint64Value: UInt64 = modelToCopy.uint64Value

            return TestModel(grdbId: id,
                             uniqueId: uniqueId,
                             dateValue: dateValue,
                             doubleValue: doubleValue,
                             floatValue: floatValue,
                             int64Value: int64Value,
                             nsIntegerValue: nsIntegerValue,
                             nsNumberValueUsingInt64: nsNumberValueUsingInt64,
                             nsNumberValueUsingUInt64: nsNumberValueUsingUInt64,
                             nsuIntegerValue: nsuIntegerValue,
                             uint64Value: uint64Value)
        }

    }
}

// MARK: - Table Metadata

extension TestModelSerializer {

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    static let idColumn = SDSColumnMetadata(columnName: "id", columnType: .primaryKey)
    static let recordTypeColumn = SDSColumnMetadata(columnName: "recordType", columnType: .int64)
    static let uniqueIdColumn = SDSColumnMetadata(columnName: "uniqueId", columnType: .unicodeString, isUnique: true)
    // Properties
    static let dateValueColumn = SDSColumnMetadata(columnName: "dateValue", columnType: .double, isOptional: true)
    static let doubleValueColumn = SDSColumnMetadata(columnName: "doubleValue", columnType: .double)
    static let floatValueColumn = SDSColumnMetadata(columnName: "floatValue", columnType: .double)
    static let int64ValueColumn = SDSColumnMetadata(columnName: "int64Value", columnType: .int64)
    static let nsIntegerValueColumn = SDSColumnMetadata(columnName: "nsIntegerValue", columnType: .int64)
    static let nsNumberValueUsingInt64Column = SDSColumnMetadata(columnName: "nsNumberValueUsingInt64", columnType: .int64, isOptional: true)
    static let nsNumberValueUsingUInt64Column = SDSColumnMetadata(columnName: "nsNumberValueUsingUInt64", columnType: .int64, isOptional: true)
    static let nsuIntegerValueColumn = SDSColumnMetadata(columnName: "nsuIntegerValue", columnType: .int64)
    static let uint64ValueColumn = SDSColumnMetadata(columnName: "uint64Value", columnType: .int64)

    // TODO: We should decide on a naming convention for
    //       tables that store models.
    public static let table = SDSTableMetadata(collection: TestModel.collection(),
                                               tableName: "model_TestModel",
                                               columns: [
        idColumn,
        recordTypeColumn,
        uniqueIdColumn,
        dateValueColumn,
        doubleValueColumn,
        floatValueColumn,
        int64ValueColumn,
        nsIntegerValueColumn,
        nsNumberValueUsingInt64Column,
        nsNumberValueUsingUInt64Column,
        nsuIntegerValueColumn,
        uint64ValueColumn
        ])
}

// MARK: - Save/Remove/Update

@objc
public extension TestModel {
    func anyInsert(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .insert, transaction: transaction)
    }

    // Avoid this method whenever feasible.
    //
    // If the record has previously been saved, this method does an overwriting
    // update of the corresponding row, otherwise if it's a new record, this
    // method inserts a new row.
    //
    // For performance, when possible, you should explicitly specify whether
    // you are inserting or updating rather than calling this method.
    func anyUpsert(transaction: SDSAnyWriteTransaction) {
        let isInserting: Bool
        if TestModel.anyFetch(uniqueId: uniqueId, transaction: transaction) != nil {
            isInserting = false
        } else {
            isInserting = true
        }
        sdsSave(saveMode: isInserting ? .insert : .update, transaction: transaction)
    }

    // This method is used by "updateWith..." methods.
    //
    // This model may be updated from many threads. We don't want to save
    // our local copy (this instance) since it may be out of date.  We also
    // want to avoid re-saving a model that has been deleted.  Therefore, we
    // use "updateWith..." methods to:
    //
    // a) Update a property of this instance.
    // b) If a copy of this model exists in the database, load an up-to-date copy,
    //    and update and save that copy.
    // b) If a copy of this model _DOES NOT_ exist in the database, do _NOT_ save
    //    this local instance.
    //
    // After "updateWith...":
    //
    // a) Any copy of this model in the database will have been updated.
    // b) The local property on this instance will always have been updated.
    // c) Other properties on this instance may be out of date.
    //
    // All mutable properties of this class have been made read-only to
    // prevent accidentally modifying them directly.
    //
    // This isn't a perfect arrangement, but in practice this will prevent
    // data loss and will resolve all known issues.
    func anyUpdate(transaction: SDSAnyWriteTransaction, block: (TestModel) -> Void) {

        block(self)

        guard let dbCopy = type(of: self).anyFetch(uniqueId: uniqueId,
                                                   transaction: transaction) else {
            return
        }

        // Don't apply the block twice to the same instance.
        // It's at least unnecessary and actually wrong for some blocks.
        // e.g. `block: { $0 in $0.someField++ }`
        if dbCopy !== self {
            block(dbCopy)
        }

        dbCopy.sdsSave(saveMode: .update, transaction: transaction)
    }

    // This method is an alternative to `anyUpdate(transaction:block:)` methods.
    //
    // We should generally use `anyUpdate` to ensure we're not unintentionally
    // clobbering other columns in the database when another concurrent update
    // has occured.
    //
    // There are cases when this doesn't make sense, e.g. when  we know we've
    // just loaded the model in the same transaction. In those cases it is
    // safe and faster to do a "overwriting" update
    func anyOverwritingUpdate(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .update, transaction: transaction)
    }

    func anyRemove(transaction: SDSAnyWriteTransaction) {
        sdsRemove(transaction: transaction)
    }

    func anyReload(transaction: SDSAnyReadTransaction) {
        anyReload(transaction: transaction, ignoreMissing: false)
    }

    func anyReload(transaction: SDSAnyReadTransaction, ignoreMissing: Bool) {
        guard let latestVersion = type(of: self).anyFetch(uniqueId: uniqueId, transaction: transaction) else {
            if !ignoreMissing {
                owsFailDebug("`latest` was unexpectedly nil")
            }
            return
        }

        setValuesForKeys(latestVersion.dictionaryValue)
    }
}

// MARK: - TestModelCursor

@objc
public class TestModelCursor: NSObject {
    private let transaction: GRDBReadTransaction
    private let cursor: RecordCursor<TestModelRecord>?

    init(transaction: GRDBReadTransaction, cursor: RecordCursor<TestModelRecord>?) {
        self.transaction = transaction
        self.cursor = cursor
    }

    public func next() throws -> TestModel? {
        guard let cursor = cursor else {
            return nil
        }
        guard let record = try cursor.next() else {
            return nil
        }
        return try TestModel.fromRecord(record)
    }

    public func all() throws -> [TestModel] {
        var result = [TestModel]()
        while true {
            guard let model = try next() else {
                break
            }
            result.append(model)
        }
        return result
    }
}

// MARK: - Obj-C Fetch

// TODO: We may eventually want to define some combination of:
//
// * fetchCursor, fetchOne, fetchAll, etc. (ala GRDB)
// * Optional "where clause" parameters for filtering.
// * Async flavors with completions.
//
// TODO: I've defined flavors that take a read transaction.
//       Or we might take a "connection" if we end up having that class.
@objc
public extension TestModel {
    class func grdbFetchCursor(transaction: GRDBReadTransaction) -> TestModelCursor {
        let database = transaction.database
        do {
            let cursor = try TestModelRecord.fetchCursor(database)
            return TestModelCursor(transaction: transaction, cursor: cursor)
        } catch {
            owsFailDebug("Read failed: \(error)")
            return TestModelCursor(transaction: transaction, cursor: nil)
        }
    }

    // Fetches a single model by "unique id".
    class func anyFetch(uniqueId: String,
                        transaction: SDSAnyReadTransaction) -> TestModel? {
        assert(uniqueId.count > 0)

        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return TestModel.ydb_fetch(uniqueId: uniqueId, transaction: ydbTransaction)
        case .grdbRead(let grdbTransaction):
            let sql = "SELECT * FROM \(TestModelRecord.databaseTableName) WHERE \(testModelColumn: .uniqueId) = ?"
            return grdbFetchOne(sql: sql, arguments: [uniqueId], transaction: grdbTransaction)
        }
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    class func anyEnumerate(transaction: SDSAnyReadTransaction,
                            block: @escaping (TestModel, UnsafeMutablePointer<ObjCBool>) -> Void) {
        anyEnumerate(transaction: transaction, batched: false, block: block)
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    class func anyEnumerate(transaction: SDSAnyReadTransaction,
                            batched: Bool = false,
                            block: @escaping (TestModel, UnsafeMutablePointer<ObjCBool>) -> Void) {
        let batchSize = batched ? Batching.kDefaultBatchSize : 0
        anyEnumerate(transaction: transaction, batchSize: batchSize, block: block)
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    //
    // If batchSize > 0, the enumeration is performed in autoreleased batches.
    class func anyEnumerate(transaction: SDSAnyReadTransaction,
                            batchSize: UInt,
                            block: @escaping (TestModel, UnsafeMutablePointer<ObjCBool>) -> Void) {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            TestModel.ydb_enumerateCollectionObjects(with: ydbTransaction) { (object, stop) in
                guard let value = object as? TestModel else {
                    owsFailDebug("unexpected object: \(type(of: object))")
                    return
                }
                block(value, stop)
            }
        case .grdbRead(let grdbTransaction):
            do {
                let cursor = TestModel.grdbFetchCursor(transaction: grdbTransaction)
                try Batching.loop(batchSize: batchSize,
                                  loopBlock: { stop in
                                      guard let value = try cursor.next() else {
                                        stop.pointee = true
                                        return
                                      }
                                      block(value, stop)
                })
            } catch let error {
                owsFailDebug("Couldn't fetch models: \(error)")
            }
        }
    }

    // Traverses all records' unique ids.
    // Records are not visited in any particular order.
    class func anyEnumerateUniqueIds(transaction: SDSAnyReadTransaction,
                                     block: @escaping (String, UnsafeMutablePointer<ObjCBool>) -> Void) {
        anyEnumerateUniqueIds(transaction: transaction, batched: false, block: block)
    }

    // Traverses all records' unique ids.
    // Records are not visited in any particular order.
    class func anyEnumerateUniqueIds(transaction: SDSAnyReadTransaction,
                                     batched: Bool = false,
                                     block: @escaping (String, UnsafeMutablePointer<ObjCBool>) -> Void) {
        let batchSize = batched ? Batching.kDefaultBatchSize : 0
        anyEnumerateUniqueIds(transaction: transaction, batchSize: batchSize, block: block)
    }

    // Traverses all records' unique ids.
    // Records are not visited in any particular order.
    //
    // If batchSize > 0, the enumeration is performed in autoreleased batches.
    class func anyEnumerateUniqueIds(transaction: SDSAnyReadTransaction,
                                     batchSize: UInt,
                                     block: @escaping (String, UnsafeMutablePointer<ObjCBool>) -> Void) {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            ydbTransaction.enumerateKeys(inCollection: TestModel.collection()) { (uniqueId, stop) in
                block(uniqueId, stop)
            }
        case .grdbRead(let grdbTransaction):
            grdbEnumerateUniqueIds(transaction: grdbTransaction,
                                   sql: """
                    SELECT \(testModelColumn: .uniqueId)
                    FROM \(TestModelRecord.databaseTableName)
                """,
                batchSize: batchSize,
                block: block)
        }
    }

    // Does not order the results.
    class func anyFetchAll(transaction: SDSAnyReadTransaction) -> [TestModel] {
        var result = [TestModel]()
        anyEnumerate(transaction: transaction) { (model, _) in
            result.append(model)
        }
        return result
    }

    // Does not order the results.
    class func anyAllUniqueIds(transaction: SDSAnyReadTransaction) -> [String] {
        var result = [String]()
        anyEnumerateUniqueIds(transaction: transaction) { (uniqueId, _) in
            result.append(uniqueId)
        }
        return result
    }

    class func anyCount(transaction: SDSAnyReadTransaction) -> UInt {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return ydbTransaction.numberOfKeys(inCollection: TestModel.collection())
        case .grdbRead(let grdbTransaction):
            return TestModelRecord.ows_fetchCount(grdbTransaction.database)
        }
    }

    // WARNING: Do not use this method for any models which do cleanup
    //          in their anyWillRemove(), anyDidRemove() methods.
    class func anyRemoveAllWithoutInstantation(transaction: SDSAnyWriteTransaction) {
        switch transaction.writeTransaction {
        case .yapWrite(let ydbTransaction):
            ydbTransaction.removeAllObjects(inCollection: TestModel.collection())
        case .grdbWrite(let grdbTransaction):
            do {
                try TestModelRecord.deleteAll(grdbTransaction.database)
            } catch {
                owsFailDebug("deleteAll() failed: \(error)")
            }
        }

        if shouldBeIndexedForFTS {
            FullTextSearchFinder.allModelsWereRemoved(collection: collection(), transaction: transaction)
        }
    }

    class func anyRemoveAllWithInstantation(transaction: SDSAnyWriteTransaction) {
        // To avoid mutationDuringEnumerationException, we need
        // to remove the instances outside the enumeration.
        let uniqueIds = anyAllUniqueIds(transaction: transaction)

        var index: Int = 0
        do {
            try Batching.loop(batchSize: Batching.kDefaultBatchSize,
                              loopBlock: { stop in
                                  guard index < uniqueIds.count else {
                                    stop.pointee = true
                                    return
                                  }
                                  let uniqueId = uniqueIds[index]
                                  index = index + 1
                                  guard let instance = anyFetch(uniqueId: uniqueId, transaction: transaction) else {
                                      owsFailDebug("Missing instance.")
                                      return
                                  }
                                  instance.anyRemove(transaction: transaction)
            })
        } catch {
            owsFailDebug("Error: \(error)")
        }

        if shouldBeIndexedForFTS {
            FullTextSearchFinder.allModelsWereRemoved(collection: collection(), transaction: transaction)
        }
    }

    class func anyExists(uniqueId: String,
                        transaction: SDSAnyReadTransaction) -> Bool {
        assert(uniqueId.count > 0)

        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return ydbTransaction.hasObject(forKey: uniqueId, inCollection: TestModel.collection())
        case .grdbRead(let grdbTransaction):
            let sql = "SELECT EXISTS ( SELECT 1 FROM \(TestModelRecord.databaseTableName) WHERE \(testModelColumn: .uniqueId) = ? )"
            let arguments: StatementArguments = [uniqueId]
            return try! Bool.fetchOne(grdbTransaction.database, sql: sql, arguments: arguments) ?? false
        }
    }
}

// MARK: - Swift Fetch

public extension TestModel {
    class func grdbFetchCursor(sql: String,
                               arguments: StatementArguments = StatementArguments(),
                               transaction: GRDBReadTransaction) -> TestModelCursor {
        do {
            let sqlRequest = SQLRequest<Void>(sql: sql, arguments: arguments, cached: true)
            let cursor = try TestModelRecord.fetchCursor(transaction.database, sqlRequest)
            return TestModelCursor(transaction: transaction, cursor: cursor)
        } catch {
            Logger.error("sql: \(sql)")
            owsFailDebug("Read failed: \(error)")
            return TestModelCursor(transaction: transaction, cursor: nil)
        }
    }

    class func grdbFetchOne(sql: String,
                            arguments: StatementArguments = StatementArguments(),
                            transaction: GRDBReadTransaction) -> TestModel? {
        assert(sql.count > 0)

        do {
            let sqlRequest = SQLRequest<Void>(sql: sql, arguments: arguments, cached: true)
            guard let record = try TestModelRecord.fetchOne(transaction.database, sqlRequest) else {
                return nil
            }

            return try TestModel.fromRecord(record)
        } catch {
            owsFailDebug("error: \(error)")
            return nil
        }
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class TestModelSerializer: SDSSerializer {

    private let model: TestModel
    public required init(model: TestModel) {
        self.model = model
    }

    // MARK: - Record

    func asRecord() throws -> SDSRecord {
        let id: Int64? = model.grdbId?.int64Value

        let recordType: SDSRecordType = .testModel
        let uniqueId: String = model.uniqueId

        // Properties
        let dateValue: Double? = archiveOptionalDate(model.dateValue)
        let doubleValue: Double = model.doubleValue
        let floatValue: Float = model.floatValue
        let int64Value: Int64 = model.int64Value
        let nsIntegerValue: Int = model.nsIntegerValue
        let nsNumberValueUsingInt64: Int64? = archiveOptionalNSNumber(model.nsNumberValueUsingInt64, conversion: { $0.int64Value })
        let nsNumberValueUsingUInt64: UInt64? = archiveOptionalNSNumber(model.nsNumberValueUsingUInt64, conversion: { $0.uint64Value })
        let nsuIntegerValue: UInt = model.nsuIntegerValue
        let uint64Value: UInt64 = model.uint64Value

        return TestModelRecord(delegate: model, id: id, recordType: recordType, uniqueId: uniqueId, dateValue: dateValue, doubleValue: doubleValue, floatValue: floatValue, int64Value: int64Value, nsIntegerValue: nsIntegerValue, nsNumberValueUsingInt64: nsNumberValueUsingInt64, nsNumberValueUsingUInt64: nsNumberValueUsingUInt64, nsuIntegerValue: nsuIntegerValue, uint64Value: uint64Value)
    }
}

// MARK: - Deep Copy

@objc
public extension TestModel {
    // We're not using this method at the moment,
    // but we might use it for validation of
    // other deep copy methods.
    func deepCopyUsingRecord() throws -> TestModel {
        guard let record = try asRecord() as? TestModelRecord else {
            throw OWSAssertionError("Could not convert to record.")
        }
        return try TestModel.fromRecord(record)
    }
}

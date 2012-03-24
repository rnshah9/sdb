(context 'sdb)

(if (= ostype "OSX")
	(constant 'SDBLIB "/usr/lib/libsdb.dylib") ; osx
	(constant 'SDBLIB "/usr/lib/libsdb.so") ; linux
)

(import SDBLIB "sdb_new")
(import SDBLIB "sdb_set")
(import SDBLIB "sdb_get")
(import SDBLIB "sdb_sync")
(import SDBLIB "sdb_free")

(define (sdb:new file lock)
	(sdb_new file lock))
(define (sdb:set db var val)
	(sdb_set db var val))
(define (sdb:add db var val)
	(sdb_add db var val))
(define (sdb:get db var)
	(let (ret (sdb_get db var))
		(if (= 0 ret) "" (get-string ret))))
(define (sdb:free db)
	(sdb_free db))
(define (sdb:sync db)
	(sdb_sync db))

(context 'MAIN)


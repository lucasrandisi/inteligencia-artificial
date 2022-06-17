rutaHacia(c1, c2).
rutaHacia(c2, c1).
rutaHacia(c1, c6).
rutaHacia(c3, c4).
rutaHacia(c3, c5).
rutaHacia(c5, c4).
rutaHacia(c5, c7).
rutaHacia(c6, c7).

rutaDesde(c7, c6).
rutaDesde(c7, c5).
rutaDesde(c6, c1).
rutaDesde(c5, c3).
rutaDesde(c4, c5).
rutaDesde(c4, c3).
rutaDesde(c2, c1).



conexion(A, A).
conexion(A, B) :- rutaHacia(A, B).
conexion(A, B) :- rutaHacia(A, X), conexion(X, B).
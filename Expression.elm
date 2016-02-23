module Expression where
import Array exposing (Array)
--see http://infoscience.epfl.ch/record/169879/files/RMTrees.pdf for array implementation detail
--in any event, if we really need to, the javascript ffi turns these arrays into javascript arrays
--so we can keep the representation the same even if we end up using it

type Exp =
  EBinaryOp Op Exp Exp
  | EUnaryOp Op Exp
  | EConst Op
  | Variable String
  | EReal Real
  | EComplex Complex 
  | EPoly Poly
  | EMatrix (Matrix Exp)
  | EVector (Vector Exp)

                
type Poly = List Mono
type alias Mono = { coeff : Float, var: String, pow: Int}
                
type alias Complex = {re : Float, im: Float}
type alias Real = Float

type alias Vector a = Array a
type alias Matrix a = Vector (Vector a)

-- Op refers to built in functions/constant
type Op =
   -- constants
   Pi | E
   -- unary ops
   | Sin | Cos | Tan | ArcSin | ArcCos | ArcTan
   | Floor | Ceiling | Round
   | Sqrt | Log
   | Re | Im 
   | Abs 
   -- binary ops
   | Plus | Minus | Mult | Frac
   | Pow | Mod
   --| Derv --We may want people to be able to add these in with other expressions? - we will add this when we write the differentiator
   

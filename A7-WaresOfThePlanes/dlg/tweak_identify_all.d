// Suppresses the reply about unidentified wares in the store
// Variables:
// state_1: first state to apply the modification to
// states_more: additional list of (space-separated) states to apply the modification to
ADD_TRANS_TRIGGER ~a7-merc~ %state_1% ~False()~ %states_more% DO 2 UNLESS ~False()~

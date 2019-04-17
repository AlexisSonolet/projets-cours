    .text
/*
bool est_present(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return est_present(val, abr->fg);
   } else {
       return est_present(val, abr->fd);
   }
}

*/
    .globl est_present
est_present:
/* Contexte : à définir
  $a0 -> premier argument : val
  $a1 -> second argument : pointeur vers le premier noeud : *abr
  $t0, $t1 : registres de calcul
  $t2 : copie de $a0 (mais change avec les appels)
*/
    /* Si $a0 == Null, go fin_false */
    addiu $sp, $sp, -12
    sw $ra, 8($sp)
    beq $a1, $zero, lbl_false
    /* $t0 = abr->val */
    lw $t0, 0($a1)
    /* Si $val == abr->val, go fin_true */
    beq $t0, $a0, lbl_true
    /* $t1 = 1 si (abr->val < val); 0 si (val < abr->val) */
    slt $t1, $t0, $a0
    /* Si val < abr->val go val_inf */
    beq $t1, $zero, val_inf
    /* Sinon go val_sup */
    j val_sup

val_inf:
    /* On empile 4 cases */
    lw $a1, 4($a1)
    jal est_present
    j fin

val_sup:
    lw $a1, 8($a1)
    jal est_present
    j fin

lbl_false:
    addu $v0, $zero, $zero
    j fin

lbl_true:
    addi $v0, $zero, 1

fin:
    lw $ra, 8($sp)
    addiu $sp, $sp, 12
    jr $ra
/*
void abr_vers_tab(struct noeud_t *abr)
{
    if (abr != NULL) {
        abr_vers_tab(abr->fg);
        *ptr = abr->val;
        ptr++;
        struct noeud_t *fd = abr->fd;
        free(abr);
        abr_vers_tab(fd);
    }
}
*/
    .globl abr_vers_tab
abr_vers_tab:
/* Contexte :  
    
    jr    $ra
*/

.data
    .comm ptr, 4

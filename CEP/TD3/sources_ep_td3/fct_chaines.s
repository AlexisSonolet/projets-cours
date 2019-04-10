/*
uint32_t taille_chaine(const char *chaine)
{
    uint32_t taille=0;
    while (chaine[taille] != '\0'){
        taille++;
    }
    return taille;
}
*/
    .text
    .globl taille_chaine
/* uint32_t taille_chaine(const char *chaine) */
/* Contexte :
    taille : registre $t0, variable de type (uint32_t)
    chaine :registre $a0, paramètre de type (char *)
    $t1 : chaine[taille]
    $v0 : valeur de retour
*/

taille_chaine:
    /* $t0 = 0 */
    addu $t0, $zero, $zero
while_taille:
    /* $t1 = $a0 + $t0 : $t1 part de $a0 et incrémente de 1 à chaque fois*/
    addu $t1, $a0, $t0
    /* $t1 <- mem[$t1 + 0] */
    lbu $t1, 0($t1)
    /* si $t1 == 0 break; */
    beq $t1, $zero, fin_while_taille
    /* $t0 ++ */
    addiu $t0, $t0, 1
    j while_taille
fin_while_taille:
    /* $v0 <- mem[$t0] */
    move $v0, $t0
    jr $ra


/*
void inverse_chaine(char *ptr, uint32_t taille)
{
    char tmp;
    int32_t dep = taille - 1;
    while (dep > 0) {
        tmp = *ptr;
        *ptr = ptr[dep];
        ptr[dep] = tmp;
        dep = dep - 2;
        ptr++;
    }
}
*/
    .globl inverse_chaine
/*void inverse_chaine(char *ptr, uint32_t taille) */
/* Contexte fourni :
* Fonction feuille pas de modif de pile à faire
* ptr : registre $a0, paramètre de type (char *)
* taille : registre $a1, paramètre de type (uint32_t)
* tmp : registre $t0, variable locale de type (char)
* dep : registre $t1, variable locale de type (int32_t)
*/
inverse_chaine:
    addiu $t1, $a1, -1
while:
    /* tmp = *ptr */
    blez $t1, fin_while
    /* *ptr = *ptr[dep] */
    lbu $t0, ($a0)
    addu $t2, $a0, $t1
    /* ptr[dep]dans $t2 */
    lbu $t2, ($t2)
    /* ptr[dep] = tmp */
    sb $t2, ($a0)
    addu $t2, $a0, $t1
    sb $t0, ($t2)
    addiu $t1, $t1, -2
    addiu $a0, $a0, 1
    j while
fin_while:
    jr $ra

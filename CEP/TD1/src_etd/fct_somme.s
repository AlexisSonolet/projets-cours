/*
uint8_t res8;
uint32_t res;

uint32_t somme(void)
{
    uint32_t i;
    uint32_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}

uint32_t sommeMem(void)
{
    uint32_t i;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}

uint8_t somme8(void)
{
    uint8_t i;
    res8 = 0;
    for (i = 1; i <= 24; i++) {
        res8 = res8 + i;
    }
    return res8;
}
*/
    .text
    .globl somme
somme:
/*  Contexte : on place i dans le registre $t0, 11 dans $t1  et res dans $v0  */
    li $t0, 1 /* $t0 = 0 */
    li $v0, 0 /* $t1 = 0 */
    li $t1, 11
for :
    beq $t0, $t1, fin_somme
    addu $v0, $v0, $t0
    addiu $t0, $t0, 1
    j for
fin_somme :
    jr $ra


    .globl sommeMem
sommeMem:
/*  Contexte : à préciser */


    .globl somme8
somme8:
/*  Contexte : à préciser */

    .data
/* uint32_t res;
 la variable globale res étant définie dans ce fichier, il est nécessaire de
 la définir dans la section .data du programme assembleur : par exemple, avec 
 la directive .comm vu qu'elle n'est pas initialisée (idem pour res8)
*/


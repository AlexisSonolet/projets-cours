/*
void tri_min(int32_t tab[], uint32_t taille)
{
    uint32_t i, j, ix_min;
    int32_t tmp; 
    for (i = 0; i < taille - 1; i++) {
        for (ix_min = i, j = i + 1; j < taille; j++) {
            if (tab[j] < tab[ix_min]) {
                ix_min = j;
            }
        }
        tmp = tab[i];
        tab[i] = tab[ix_min];
        tab[ix_min] = tmp;
    }
}
*/
    .text
    .globl tri_min
/* void tri_min(int32_t tab[], uint32_t taille) */
/* Contexte :
    * tab = $a0
    * taille = $a1
    * i = $t0
    * j = $t1
    * ix_min = $t2

*/
tri_min:
    




    jr $ra


    PROCESSOR 16f628A       ; diretiva para informar ao montador sobre o microcontrolador
    #include <p16f628a.inc> ; defini��es espec�ficas do microcontrolador
	
    __CONFIG _CP_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_OFF & _WDT_OFF & _PWRTE_ON & _INTOSC_OSC_NOCLKOUT
    
    ORG 0x000   ; Diretiva do montador para indicar o endere�o onde iniciar

    ;SETUP do microcontrolador
    movlw 0x07  ; Desativar os comparadores
    movwf CMCON ;Mover a palavra de W para CMCON
    banksel TRISA   ;Mudar para o banco onde est� TRISA
    clrf    TRISA   ;zero em todos os bits de TRISA. Todos os pinos da Porta A como sa�da
main:
    banksel PORTA
    bsf PORTA,1
    
    goto main
    end
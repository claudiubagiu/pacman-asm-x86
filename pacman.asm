.386
.model flat, stdcall 

includelib msvcrt.lib
extern exit: proc 
extern malloc: proc
extern memset: proc 
extern printf: proc 

includelib canvas.lib 
extern BeginDrawing: proc 

public start

.data 
window_title DB "Pac-Man", 0
area_width EQU 960
area_height EQU 720
area DD 0

check_coin DB 0
check_power DB 0

square_length EQU 30
coin_length EQU 6
power_lenght EQU 10
hp DD 3

character_width EQU 30 
character_height EQU 30

score DD 0

arg1 EQU 8
arg2 EQU 12
arg3 EQU 16
arg4 EQU 20

pacman_x_coord DD 370
pacman_y_coord DD 490

blinky_x_coord DD 370
blinky_y_coord DD 310

pinky_x_coord DD 370
pinky_y_coord DD 310

inky_x_coord DD 370
inky_y_coord DD 310

clyde_x_coord DD 370
clyde_y_coord DD 310


pacman_up_collision DB 0
pacman_right_collision DB 0
pacman_down_collision DB 0
pacman_left_collision DB 0


symbol_width EQU 10
symbol_height EQU 20
include digits.inc
include letters.inc
include pacman.inc
include blinky.inc
include inky.inc 
include clyde.inc 
include pinky.inc
include frightened.inc
include pacman_up.inc 
include pacman_right.inc 
include pacman_down.inc 
include pacman_left.inc


blinky_direction DD 3 ; 0 - up 1 - right 2 - down 3 - left
pinky_direction DD 1 ; 0 - up 1 - right 2 - down 3 - left
inky_direction DD 3 ; 0 - up 1 - right 2 - down 3 - left
clyde_direction DD 1 ; 0 - up 1 - right 2 - down 3 - left
pacman_direction DD 3 ; 0 - up 1 - right 2 - down 3 - left
pacman_next_direction DD 3 ; 0 - up 1 - right 2 - down 3 - left

blinky_ghost_mode DD 0 ; 0 - chase mode or scatter mode, 1 - frightened mode
pinky_ghost_mode DD 0 ; 0 - chase mode or scatter mode, 1 - frightened mode
inky_ghost_mode DD 0 ; 0 - chase mode or scatter mode, 1 - frightened mode
clyde_ghost_mode DD 0 ; 0 - chase mode or scatter mode, 1 - frightened mode


blinky_timer DD 0
pinky_timer DD 0
inky_timer DD 0
clyde_timer DD 0
power_timer DD 150

show_pinky DD 0
show_inky DD 0
show_clyde DD 0
show_pacman DD 0 

blinky_collision_up_check DB 0
blinky_collision_right_check DB 0
blinky_collision_down_check DB 0
blinky_collision_left_check DB 0

pinky_collision_up_check DB 0
pinky_collision_right_check DB 0
pinky_collision_down_check DB 0
pinky_collision_left_check DB 0

inky_collision_up_check DB 0
inky_collision_right_check DB 0
inky_collision_down_check DB 0
inky_collision_left_check DB 0

clyde_collision_up_check DB 0
clyde_collision_right_check DB 0
clyde_collision_down_check DB 0
clyde_collision_left_check DB 0

blinky_distance_up DD 0
blinky_distance_right DD 0
blinky_distance_down DD 0
blinky_distance_left DD 0

pinky_distance_up DD 0
pinky_distance_right DD 0
pinky_distance_down DD 0
pinky_distance_left DD 0

inky_distance_up DD 0
inky_distance_right DD 0
inky_distance_down DD 0
inky_distance_left DD 0

clyde_distance_up DD 0
clyde_distance_right DD 0
clyde_distance_down DD 0
clyde_distance_left DD 0

blinky_first_min DD 0
blinky_second_min DD 0
blinky_third_min DD 0
blinky_fourth_min DD 0

pinky_first_min DD 0
pinky_second_min DD 0
pinky_third_min DD 0
pinky_fourth_min DD 0

inky_first_min DD 0
inky_second_min DD 0
inky_third_min DD 0
inky_fourth_min DD 0

clyde_first_min DD 0
clyde_second_min DD 0
clyde_third_min DD 0
clyde_fourth_min DD 0

coin0 DD 0
coin1 DD 0 
coin2 DD 0
coin3 DD 0
coin4 DD 0
coin5 DD 0
coin6 DD 0
coin7 DD 0
coin8 DD 0
coin9 DD 0
coin10 DD 0
coin11 DD 0
coin12 DD 0
coin13 DD 0
coin14 DD 0
coin15 DD 0
coin16 DD 0
coin17 DD 0
coin18 DD 0
coin19 DD 0
coin20 DD 0
coin21 DD 0
coin22 DD 0
coin23 DD 0
coin24 DD 0
coin25 DD 0
coin26 DD 0
coin27 DD 0
coin28 DD 0
coin29 DD 0
coin30 DD 0
coin31 DD 0
coin32 DD 0
coin33 DD 0
coin34 DD 0
coin35 DD 0
coin36 DD 0
coin37 DD 0
coin38 DD 0
coin39 DD 0
coin40 DD 0
coin41 DD 0
coin42 DD 0
coin43 DD 0
coin44 DD 0
coin45 DD 0
coin46 DD 0
coin47 DD 0
coin48 DD 0
coin49 DD 0
coin50 DD 0
coin51 DD 0
coin52 DD 0
coin53 DD 0
coin54 DD 0
coin55 DD 0
coin56 DD 0
coin57 DD 0
coin58 DD 0
coin59 DD 0
coin60 DD 0
coin61 DD 0
coin62 DD 0
coin63 DD 0
coin64 DD 0
coin65 DD 0
coin66 DD 0
coin67 DD 0
coin68 DD 0
coin69 DD 0
coin70 DD 0
coin71 DD 0
coin72 DD 0
coin73 DD 0
coin74 DD 0
coin75 DD 0
coin76 DD 0
coin77 DD 0
coin78 DD 0
coin79 DD 0
coin80 DD 0
coin81 DD 0
coin82 DD 0
coin83 DD 0
coin84 DD 0
coin85 DD 0
coin86 DD 0
coin87 DD 0
coin88 DD 0
coin89 DD 0
coin90 DD 0
coin91 DD 0
coin92 DD 0
coin93 DD 0
coin94 DD 0
coin95 DD 0
coin96 DD 0
coin97 DD 0
coin98 DD 0
coin99 DD 0
coin100 DD 0
coin101 DD 0
coin102 DD 0
coin103 DD 0
coin104 DD 0
coin105 DD 0
coin106 DD 0
coin107 DD 0
coin108 DD 0
coin109 DD 0
coin110 DD 0
coin111 DD 0
coin112 DD 0
coin113 DD 0
coin114 DD 0
coin115 DD 0
coin116 DD 0
coin117 DD 0
coin118 DD 0
coin119 DD 0
coin120 DD 0
coin121 DD 0
coin122 DD 0
coin123 DD 0
coin124 DD 0
coin125 DD 0
coin126 DD 0
coin127 DD 0
coin128 DD 0
coin129 DD 0
coin130 DD 0
coin131 DD 0
coin132 DD 0
coin133 DD 0
coin134 DD 0
coin135 DD 0
coin136 DD 0
coin137 DD 0
coin138 DD 0
coin139 DD 0
coin140 DD 0
coin141 DD 0
coin142 DD 0
coin143 DD 0

power0 DD 0
power1 DD 0
power2 DD 0
power3 DD 0

.code

; procedure that calculates distance beetwen pacman and blinky (blinky_y_coord--)
; blinky_distance_up = (pacman_x_coord - blinky_x_coord) ^ 2 + (pacman_y_coord - blinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - blinky_x_coord
; arg4 - blinky_y_coord
blinky_distance_up_target proc
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; blinky_x_coord
    sub eax, ebx
    imul eax, eax
    mov [blinky_distance_up], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; blinky_y_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    add [blinky_distance_up], eax

    popa
    mov esp, ebp
    pop ebp
    ret 
blinky_distance_up_target endp

blinky_distance_up_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call blinky_distance_up_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and blinky (blinky_x_coord++)
; blinky_distance_right = (pacman_x_coord - blinky_x_coord) ^ 2 + (pacman_y_coord - blinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - blinky_x_coord
; arg4 - blinky_y_coord
blinky_distance_right_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; blinky_x_coord
    add ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [blinky_distance_right], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; blinky_y_coord
    sub eax, ebx
    imul eax, eax
    add [blinky_distance_right], eax

    popa 
    mov esp, ebp
    pop ebp
    ret
blinky_distance_right_target endp

blinky_distance_right_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call blinky_distance_right_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and blinky (blinky_y_coord++)
; blinky_distance_down = (pacman_x_coord - blinky_x_coord) ^ 2 + (pacman_y_coord - blinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - blinky_x_coord
; arg4 - blinky_y_coord
blinky_distance_down_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; blinky_x_coord
    sub eax, ebx
    imul eax, eax
    mov [blinky_distance_down], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; blinky_y_coord
    add ebx, 1
    sub ebx, eax
    imul ebx, ebx
    add [blinky_distance_down], ebx

    popa 
    mov esp, ebp
    pop ebp
    ret
blinky_distance_down_target endp

blinky_distance_down_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call blinky_distance_down_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and blinky (blinky_x_coord--)
; blinky_distance_left = (pacman_x_coord - blinky_x_coord) ^ 2 + (pacman_y_coord - blinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - blinky_x_coord
; arg4 - blinky_y_coord
blinky_distance_left_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; blinky_x_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [blinky_distance_left], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; blinky_y_coord
    sub ebx, eax
    imul ebx, ebx
    add [blinky_distance_left], ebx

    popa
    mov esp, ebp
    pop ebp
    ret
blinky_distance_left_target endp

blinky_distance_left_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call blinky_distance_left_target
    add esp, 16
endm

; procedure to check the collision beetween blinky and square if blinky_direction = 2 (down)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
blinky_down_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov blinky_collision_down_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, 30
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov blinky_collision_down_check, 1
coll:
    add edi, 4
    loop loop_col


    popa
    mov esp, ebp
    pop ebp
    ret
blinky_down_collision endp

blinky_down_collision_macro macro area, x, y
    push y
    push x
    push area
    call blinky_down_collision
    add esp, 12 
endm


; procedure to check the collision beetween blinky and square if blinky_direction = 3 (left)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
blinky_left_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov blinky_collision_left_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    sub eax, 1
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov blinky_collision_left_check, 1
coll:
    loop loop_row	


    popa
    mov esp, ebp
    pop ebp
    ret
blinky_left_collision endp

blinky_left_collision_macro macro area, x, y
    push y
    push x
    push area
    call blinky_left_collision
    add esp, 12
endm






; procedure to check the collision beetween blinky and square if blinky_direction = 0 (up)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
blinky_up_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov blinky_collision_up_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, 1
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov blinky_collision_up_check, 1
coll:
    add edi, 4
    loop loop_col

    popa
    mov esp, ebp
    pop ebp
    ret
blinky_up_collision endp

blinky_up_collision_macro macro area, x, y
    push y
    push x
    push area
    call blinky_up_collision
    add esp, 12
endm

; procedure to check the collision beetween blinky and square if blinky_direction = 1 (right)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
blinky_right_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov blinky_collision_right_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    add eax, 30
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov blinky_collision_right_check, 1
coll:
    loop loop_row
    popa
    mov esp, ebp
    pop ebp
    ret
blinky_right_collision endp

blinky_right_collision_macro macro area, x, y
    push y
    push x
    push area
    call blinky_right_collision
    add esp, 12
endm


;procedure for movement of blinky
blinky_movement proc
    push ebp 
    mov ebp, esp 
    pusha


    cmp blinky_direction, 0
    je up_direction
    cmp blinky_direction, 1
    je right_direction
    cmp blinky_direction, 2
    je down_direction
    cmp blinky_direction, 3
    je left_direction

up_direction:

    blinky_right_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_right_check, 1
    je right_collision1
    add blinky_x_coord, 3
    mov blinky_direction, 1
    jmp end_if

right_collision1:

    blinky_left_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_left_check, 1
    je left_collision1
    sub blinky_x_coord, 3
    mov blinky_direction, 3
    jmp end_if

left_collision1:

    blinky_up_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_up_check, 1
    je up_collision1
    sub blinky_y_coord, 3
    mov blinky_direction, 0
    jmp end_if

up_collision1:

    jmp end_if

right_direction:

    blinky_right_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_right_check, 1
    je right_collision2
    add blinky_x_coord, 3
    mov blinky_direction, 1
    jmp end_if

right_collision2:

    blinky_up_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_up_check, 1
    je up_collision2
    sub blinky_y_coord, 3
    mov blinky_direction, 0
    jmp end_if

up_collision2:

    blinky_down_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_down_check, 1
    je down_collision2
    add blinky_y_coord, 3
    mov blinky_direction, 2
    jmp end_if

down_collision2:

    jmp end_if

down_direction:

    blinky_right_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_right_check, 1
    je right_collision3
    add blinky_x_coord, 3
    mov blinky_direction, 1
    jmp end_if

right_collision3:


    blinky_left_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_left_check, 1
    je left_collision3
    sub blinky_x_coord, 3
    mov blinky_direction, 3
    jmp end_if

left_collision3:

    blinky_down_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_down_check, 1
    je down_collision3
    add blinky_y_coord, 3
    mov blinky_direction, 2
    jmp end_if

down_collision3:

    jmp end_if

left_direction:

    blinky_up_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_up_check, 1
    je up_collision4
    sub blinky_y_coord, 3
    mov blinky_direction, 0
    jmp end_if

up_collision4:

    blinky_down_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_down_check, 1
    je down_collision4
    add blinky_y_coord, 3
    mov blinky_direction, 2
    jmp end_if

down_collision4:

    blinky_left_collision_macro area, blinky_x_coord, blinky_y_coord
    cmp blinky_collision_left_check, 1
    je left_collision4
    sub blinky_x_coord, 3
    mov blinky_direction, 3
    jmp end_if

left_collision4:

    jmp end_if

end_if:

    popa 
    mov esp, ebp
    pop ebp
    ret
blinky_movement endp

blinky_movement_macro macro 
    call blinky_movement
endm

;procedure that returns the minimum beetween four values to minimum value
; arg1 - first value
; arg2 - second value
; arg3 - third value
; arg4 - fourth value
blinky_chase_mode proc 
    push ebp 
    mov ebp, esp
    pusha

    blinky_distance_up_target_macro pacman_x_coord, pacman_y_coord, blinky_x_coord, blinky_y_coord
    blinky_distance_right_target_macro pacman_x_coord, pacman_y_coord, blinky_x_coord, blinky_y_coord
    blinky_distance_down_target_macro pacman_x_coord, pacman_y_coord, blinky_x_coord, blinky_y_coord
    blinky_distance_left_target_macro pacman_x_coord, pacman_y_coord, blinky_x_coord, blinky_y_coord


    mov eax, blinky_distance_up ; first value
    mov ebx, blinky_distance_right ; second value
    mov ecx, blinky_distance_down ; third value
    mov edx, blinky_distance_left ; fourth value

    push eax
    push ebx
    push ecx
    push edx

    cmp ebx, eax
    jl swap1
    jmp compare1
swap1:
    xchg eax, ebx
compare1:
    cmp ecx, eax
    jl swap2
    jmp compare2
swap2:
    xchg eax, ecx
compare2:
    cmp edx, eax
    jl swap3
    jmp compare3
swap3:
    xchg eax, edx
compare3:
    cmp ecx, ebx
    jl swap4
    jmp compare4
swap4:
    xchg ebx, ecx
compare4:
    cmp edx, ebx
    jl swap5
    jmp compare5
swap5:
    xchg ebx, edx
compare5:
    cmp edx, ecx
    jl swap6
    jmp compare6
swap6:
    xchg ecx, edx
compare6:


    mov blinky_first_min, eax
    mov blinky_second_min, ebx
    mov blinky_third_min, ecx
    mov blinky_fourth_min, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    

    blinky_up_collision_macro area, blinky_x_coord, blinky_y_coord
    blinky_right_collision_macro area, blinky_x_coord, blinky_y_coord
    blinky_down_collision_macro area, blinky_x_coord, blinky_y_coord
    blinky_left_collision_macro area, blinky_x_coord, blinky_y_coord

    cmp blinky_first_min, eax
    je up
tag1:
    cmp blinky_first_min, ebx
    je right 
tag2:
    cmp blinky_first_min, ecx
    je down 
tag3:
    cmp blinky_first_min, edx
    je left

    jmp next_min

up:
    cmp blinky_collision_up_check, 1
    je tag1 
    cmp blinky_direction, 2
    je tag1
    mov blinky_direction, 0 
    sub blinky_y_coord, 3
    jmp end_if1
right:
    cmp blinky_collision_right_check, 1
    je tag2
    cmp blinky_direction, 3
    je tag2
    mov blinky_direction, 1
    add blinky_x_coord, 3
    jmp end_if1 
down:
    cmp blinky_collision_down_check, 1
    je tag3
    cmp blinky_direction, 0
    je tag3
    mov blinky_direction, 2
    add blinky_y_coord, 3
    jmp end_if1
left:
    cmp blinky_collision_left_check, 1
    je next_min
    cmp blinky_direction, 1
    je next_min
    mov blinky_direction, 3
    sub blinky_x_coord, 3
    jmp end_if1
end_if1:
    jmp end_if

next_min:

    cmp blinky_second_min, eax
    je up2
tag4:
    cmp blinky_second_min, ebx
    je right2
tag5:
    cmp blinky_second_min, ecx
    je down2
tag6:
    cmp blinky_second_min, edx
    je left2

    jmp next_min2

up2:
    cmp blinky_collision_up_check, 1
    je tag4
    cmp blinky_direction, 2
    je tag4
    mov blinky_direction, 0
    sub blinky_y_coord, 3
    jmp end_if2
right2:
    cmp blinky_collision_right_check, 1
    je tag5
    cmp blinky_direction, 3
    je tag5
    mov blinky_direction, 1
    add blinky_x_coord, 3
    jmp end_if2
down2:
    cmp blinky_collision_down_check, 1
    je tag6
    cmp blinky_direction, 0
    je tag6
    mov blinky_direction, 2
    add blinky_y_coord, 3
    jmp end_if2
left2:
    cmp blinky_collision_left_check, 1
    je next_min2
    cmp blinky_direction, 1
    je next_min2
    mov blinky_direction, 3
    sub blinky_x_coord, 3
    jmp end_if2
end_if2:
    jmp end_if

next_min2:

    cmp blinky_third_min, eax
    je up3
tag7:
    cmp blinky_third_min, ebx
    je right3
tag8:
    cmp blinky_third_min, ecx
    je down3
tag9:
    cmp blinky_third_min, edx
    je left3

    jmp next_min3

up3:
    cmp blinky_collision_up_check, 1
    je tag7
    cmp blinky_direction, 2
    je tag7
    mov blinky_direction, 0
    sub blinky_y_coord, 3
    jmp end_if3
right3:
    cmp blinky_collision_right_check, 1
    je tag8
    cmp blinky_direction, 3
    je tag8
    mov blinky_direction, 1
    add blinky_x_coord, 3
    jmp end_if3
down3:
    cmp blinky_collision_down_check, 1
    je tag9
    cmp blinky_direction, 0
    je tag9
    mov blinky_direction, 2
    add blinky_y_coord, 3
    jmp end_if3
left3:
    cmp blinky_collision_left_check, 1
    je next_min3
    cmp blinky_direction, 1
    je next_min3
    mov blinky_direction, 3
    sub blinky_x_coord, 3
    jmp end_if3
end_if3:
    jmp end_if

next_min3:

    cmp blinky_fourth_min, eax
    je up4
tag10:
    cmp blinky_fourth_min, ebx
    je right4
tag11:
    cmp blinky_fourth_min, ecx
    je down4
tag12:
    cmp blinky_fourth_min, edx
    je left4

    jmp end_if

up4:
    cmp blinky_collision_up_check, 1
    je tag10
    cmp blinky_direction, 2
    je tag10
    mov blinky_direction, 0
    sub blinky_y_coord, 3
    jmp end_if4
right4:
    cmp blinky_collision_right_check, 1
    je tag11
    cmp blinky_direction, 3
    je tag11
    mov blinky_direction, 1
    add blinky_x_coord, 3
    jmp end_if4
down4:
    cmp blinky_collision_down_check, 1
    je tag12
    cmp blinky_direction, 0
    je tag12
    mov blinky_direction, 2
    add blinky_y_coord, 3
    jmp end_if4
left4:
    cmp blinky_collision_left_check, 1
    je end_if
    cmp blinky_direction, 1
    je end_if
    mov blinky_direction, 3
    sub blinky_x_coord, 3
    jmp end_if4
end_if4:
    jmp end_if

end_if:
    popa 
    mov esp, ebp
    pop ebp
    ret
blinky_chase_mode endp

blinky_chase_mode_macro macro x, y, z, t
    call blinky_chase_mode
endm

; procedure that calculates distance beetwen pacman and pinky (pinky_y_coord--)
; pinky_distance_up = (pacman_x_coord - pinky_x_coord) ^ 2 + (pacman_y_coord - pinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - pinky_x_coord
; arg4 - pinky_y_coord
pinky_distance_up_target proc
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; pinky_x_coord
    sub eax, ebx
    imul eax, eax
    mov [pinky_distance_up], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; pinky_y_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    add [pinky_distance_up], eax

    popa
    mov esp, ebp
    pop ebp
    ret 
pinky_distance_up_target endp

pinky_distance_up_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call pinky_distance_up_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and pinky (pinky_x_coord++)
; pinky_distance_right = (pacman_x_coord - pinky_x_coord) ^ 2 + (pacman_y_coord - pinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - pinky_x_coord
; arg4 - pinky_y_coord
pinky_distance_right_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; pinky_x_coord
    add ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [pinky_distance_right], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; pinky_y_coord
    sub eax, ebx
    imul eax, eax
    add [pinky_distance_right], eax

    popa 
    mov esp, ebp
    pop ebp
    ret
pinky_distance_right_target endp

pinky_distance_right_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call pinky_distance_right_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and pinky (pinky_y_coord++)
; pinky_distance_down = (pacman_x_coord - pinky_x_coord) ^ 2 + (pacman_y_coord - pinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - pinky_x_coord
; arg4 - pinky_y_coord
pinky_distance_down_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; pinky_x_coord
    sub eax, ebx
    imul eax, eax
    mov [pinky_distance_down], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; pinky_y_coord
    add ebx, 1
    sub ebx, eax
    imul ebx, ebx
    add [pinky_distance_down], ebx

    popa 
    mov esp, ebp
    pop ebp
    ret
pinky_distance_down_target endp

pinky_distance_down_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call pinky_distance_down_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and pinky (pinky_x_coord--)
; pinky_distance_left = (pacman_x_coord - pinky_x_coord) ^ 2 + (pacman_y_coord - pinky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - pinky_x_coord
; arg4 - pinky_y_coord
pinky_distance_left_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; pinky_x_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [pinky_distance_left], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; pinky_y_coord
    sub ebx, eax
    imul ebx, ebx
    add [pinky_distance_left], ebx

    popa
    mov esp, ebp
    pop ebp
    ret
pinky_distance_left_target endp

pinky_distance_left_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call pinky_distance_left_target
    add esp, 16
endm

; procedure to check the collision beetween pinky and square if pinky_direction = 2 (down)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
pinky_down_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov pinky_collision_down_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, 30
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pinky_collision_down_check, 1
coll:
    add edi, 4
    loop loop_col


    popa
    mov esp, ebp
    pop ebp
    ret
pinky_down_collision endp

pinky_down_collision_macro macro area, x, y
    push y
    push x
    push area
    call pinky_down_collision
    add esp, 12 
endm


; procedure to check the collision beetween pinky and square if pinky_direction = 3 (left)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
pinky_left_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov pinky_collision_left_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    sub eax, 1
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pinky_collision_left_check, 1
coll:
    loop loop_row	


    popa
    mov esp, ebp
    pop ebp
    ret
pinky_left_collision endp

pinky_left_collision_macro macro area, x, y
    push y
    push x
    push area
    call pinky_left_collision
    add esp, 12
endm

; procedure to check the collision beetween pinky and square if pinky_direction = 0 (up)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
pinky_up_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov pinky_collision_up_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, 1
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pinky_collision_up_check, 1
coll:
    add edi, 4
    loop loop_col

    popa
    mov esp, ebp
    pop ebp
    ret
pinky_up_collision endp

pinky_up_collision_macro macro area, x, y
    push y
    push x
    push area
    call pinky_up_collision
    add esp, 12
endm

; procedure to check the collision beetween pinky and square if pinky_direction = 1 (right)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
pinky_right_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov pinky_collision_right_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    add eax, 30
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pinky_collision_right_check, 1
coll:
    loop loop_row
    popa
    mov esp, ebp
    pop ebp
    ret
pinky_right_collision endp

pinky_right_collision_macro macro area, x, y
    push y
    push x
    push area
    call pinky_right_collision
    add esp, 12
endm

;procedure for movement of pinky
pinky_movement proc
    push ebp 
    mov ebp, esp 
    pusha


    cmp pinky_direction, 0
    je up_direction
    cmp pinky_direction, 1
    je right_direction
    cmp pinky_direction, 2
    je down_direction
    cmp pinky_direction, 3
    je left_direction

up_direction:

    pinky_left_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_left_check, 1
    je left_collision1
    sub pinky_x_coord, 3
    mov pinky_direction, 3
    jmp end_if

left_collision1:

    pinky_right_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_right_check, 1
    je right_collision1
    add pinky_x_coord, 3
    mov pinky_direction, 1
    jmp end_if

right_collision1:

    pinky_up_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_up_check, 1
    je up_collision1
    sub pinky_y_coord, 3
    mov pinky_direction, 0
    jmp end_if

up_collision1:

    jmp end_if

right_direction:

    pinky_down_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_down_check, 1
    je down_collision2
    add pinky_y_coord, 3
    mov pinky_direction, 2
    jmp end_if

down_collision2:

    pinky_up_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_up_check, 1
    je up_collision2
    sub pinky_y_coord, 3
    mov pinky_direction, 0
    jmp end_if

up_collision2:

    pinky_right_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_right_check, 1
    je right_collision2
    add pinky_x_coord, 3
    mov pinky_direction, 1
    jmp end_if

right_collision2:



    jmp end_if

down_direction:

    pinky_left_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_left_check, 1
    je left_collision3
    sub pinky_x_coord, 3
    mov pinky_direction, 3
    jmp end_if

left_collision3:

    pinky_right_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_right_check, 1
    je right_collision3
    add pinky_x_coord, 3
    mov pinky_direction, 1
    jmp end_if

right_collision3:

    pinky_down_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_down_check, 1
    je down_collision3
    add pinky_y_coord, 3
    mov pinky_direction, 2
    jmp end_if

down_collision3:

    jmp end_if

left_direction:

    pinky_left_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_left_check, 1
    je left_collision4
    sub pinky_x_coord, 3
    mov pinky_direction, 3
    jmp end_if

left_collision4:

    pinky_up_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_up_check, 1
    je up_collision4
    sub pinky_y_coord, 3
    mov pinky_direction, 0
    jmp end_if

up_collision4:

    pinky_down_collision_macro area, pinky_x_coord, pinky_y_coord
    cmp pinky_collision_down_check, 1
    je down_collision4
    add pinky_y_coord, 3
    mov pinky_direction, 2
    jmp end_if

down_collision4:

    jmp end_if

end_if:

    popa 
    mov esp, ebp
    pop ebp
    ret
pinky_movement endp

pinky_movement_macro macro 
    call pinky_movement
endm

;procedure that returns the minimum beetween four values to minimum value
; arg1 - first value
; arg2 - second value
; arg3 - third value
; arg4 - fourth value
pinky_chase_mode proc 
    push ebp 
    mov ebp, esp
    pusha

    pinky_distance_up_target_macro pacman_x_coord, pacman_y_coord, pinky_x_coord, pinky_y_coord
    pinky_distance_right_target_macro pacman_x_coord, pacman_y_coord, pinky_x_coord, pinky_y_coord
    pinky_distance_down_target_macro pacman_x_coord, pacman_y_coord, pinky_x_coord, pinky_y_coord
    pinky_distance_left_target_macro pacman_x_coord, pacman_y_coord, pinky_x_coord, pinky_y_coord


    mov eax, pinky_distance_up ; first value
    mov ebx, pinky_distance_right ; second value
    mov ecx, pinky_distance_down ; third value
    mov edx, pinky_distance_left ; fourth value

    push eax
    push ebx
    push ecx
    push edx

    cmp ebx, eax
    jl swap1
    jmp compare1
swap1:
    xchg eax, ebx
compare1:
    cmp ecx, eax
    jl swap2
    jmp compare2
swap2:
    xchg eax, ecx
compare2:
    cmp edx, eax
    jl swap3
    jmp compare3
swap3:
    xchg eax, edx
compare3:
    cmp ecx, ebx
    jl swap4
    jmp compare4
swap4:
    xchg ebx, ecx
compare4:
    cmp edx, ebx
    jl swap5
    jmp compare5
swap5:
    xchg ebx, edx
compare5:
    cmp edx, ecx
    jl swap6
    jmp compare6
swap6:
    xchg ecx, edx
compare6:


    mov pinky_first_min, eax
    mov pinky_second_min, ebx
    mov pinky_third_min, ecx
    mov pinky_fourth_min, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    

    pinky_up_collision_macro area, pinky_x_coord, pinky_y_coord
    pinky_right_collision_macro area, pinky_x_coord, pinky_y_coord
    pinky_down_collision_macro area, pinky_x_coord, pinky_y_coord
    pinky_left_collision_macro area, pinky_x_coord, pinky_y_coord

    cmp pinky_first_min, eax
    je up
tag1:
    cmp pinky_first_min, ebx
    je right 
tag2:
    cmp pinky_first_min, ecx
    je down 
tag3:
    cmp pinky_first_min, edx
    je left

    jmp next_min

up:
    cmp pinky_collision_up_check, 1
    je tag1 
    cmp pinky_direction, 2
    je tag1
    mov pinky_direction, 0 
    sub pinky_y_coord, 3
    jmp end_if1
right:
    cmp pinky_collision_right_check, 1
    je tag2
    cmp pinky_direction, 3
    je tag2
    mov pinky_direction, 1
    add pinky_x_coord, 3
    jmp end_if1 
down:
    cmp pinky_collision_down_check, 1
    je tag3
    cmp pinky_direction, 0
    je tag3
    mov pinky_direction, 2
    add pinky_y_coord, 3
    jmp end_if1
left:
    cmp pinky_collision_left_check, 1
    je next_min
    cmp pinky_direction, 1
    je next_min
    mov pinky_direction, 3
    sub pinky_x_coord, 3
    jmp end_if1
end_if1:
    jmp end_if

next_min:

    cmp pinky_second_min, eax
    je up2
tag4:
    cmp pinky_second_min, ebx
    je right2
tag5:
    cmp pinky_second_min, ecx
    je down2
tag6:
    cmp pinky_second_min, edx
    je left2

    jmp next_min2

up2:
    cmp pinky_collision_up_check, 1
    je tag4
    cmp pinky_direction, 2
    je tag4
    mov pinky_direction, 0
    sub pinky_y_coord, 3
    jmp end_if2
right2:
    cmp pinky_collision_right_check, 1
    je tag5
    cmp pinky_direction, 3
    je tag5
    mov pinky_direction, 1
    add pinky_x_coord, 3
    jmp end_if2
down2:
    cmp pinky_collision_down_check, 1
    je tag6
    cmp pinky_direction, 0
    je tag6
    mov pinky_direction, 2
    add pinky_y_coord, 3
    jmp end_if2
left2:
    cmp pinky_collision_left_check, 1
    je next_min2
    cmp pinky_direction, 1
    je next_min2
    mov pinky_direction, 3
    sub pinky_x_coord, 3
    jmp end_if2
end_if2:
    jmp end_if

next_min2:

    cmp pinky_third_min, eax
    je up3
tag7:
    cmp pinky_third_min, ebx
    je right3
tag8:
    cmp pinky_third_min, ecx
    je down3
tag9:
    cmp pinky_third_min, edx
    je left3

    jmp next_min3

up3:
    cmp pinky_collision_up_check, 1
    je tag7
    cmp pinky_direction, 2
    je tag7
    mov pinky_direction, 0
    sub pinky_y_coord, 3
    jmp end_if3
right3:
    cmp pinky_collision_right_check, 1
    je tag8
    cmp pinky_direction, 3
    je tag8
    mov pinky_direction, 1
    add pinky_x_coord, 3
    jmp end_if3
down3:
    cmp pinky_collision_down_check, 1
    je tag9
    cmp pinky_direction, 0
    je tag9
    mov pinky_direction, 2
    add pinky_y_coord, 3
    jmp end_if3
left3:
    cmp pinky_collision_left_check, 1
    je next_min3
    cmp pinky_direction, 1
    je next_min3
    mov pinky_direction, 3
    sub pinky_x_coord, 3
    jmp end_if3
end_if3:
    jmp end_if

next_min3:

    cmp pinky_fourth_min, eax
    je up4
tag10:
    cmp pinky_fourth_min, ebx
    je right4
tag11:
    cmp pinky_fourth_min, ecx
    je down4
tag12:
    cmp pinky_fourth_min, edx
    je left4

    jmp end_if

up4:
    cmp pinky_collision_up_check, 1
    je tag10
    cmp pinky_direction, 2
    je tag10
    mov pinky_direction, 0
    sub pinky_y_coord, 3
    jmp end_if4
right4:
    cmp pinky_collision_right_check, 1
    je tag11
    cmp pinky_direction, 3
    je tag11
    mov pinky_direction, 1
    add pinky_x_coord, 3
    jmp end_if4
down4:
    cmp pinky_collision_down_check, 1
    je tag12
    cmp pinky_direction, 0
    je tag12
    mov pinky_direction, 2
    add pinky_y_coord, 3
    jmp end_if4
left4:
    cmp pinky_collision_left_check, 1
    je end_if
    cmp pinky_direction, 1
    je end_if
    mov pinky_direction, 3
    sub pinky_x_coord, 3
    jmp end_if4
end_if4:
    jmp end_if

end_if:
    popa 
    mov esp, ebp
    pop ebp
    ret
pinky_chase_mode endp

pinky_chase_mode_macro macro x, y, z, t
    call pinky_chase_mode
endm

; procedure that calculates distance beetwen pacman and inky (inky_y_coord--)
; inky_distance_up = (pacman_x_coord - inky_x_coord) ^ 2 + (pacman_y_coord - inky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - inky_x_coord
; arg4 - inky_y_coord
inky_distance_up_target proc
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; inky_x_coord
    sub eax, ebx
    imul eax, eax
    mov [inky_distance_up], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; inky_y_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    add [inky_distance_up], eax

    popa
    mov esp, ebp
    pop ebp
    ret 
inky_distance_up_target endp

inky_distance_up_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call inky_distance_up_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and inky (inky_x_coord++)
; inky_distance_right = (pacman_x_coord - inky_x_coord) ^ 2 + (pacman_y_coord - inky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - inky_x_coord
; arg4 - inky_y_coord
inky_distance_right_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; inky_x_coord
    add ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [inky_distance_right], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; inky_y_coord
    sub eax, ebx
    imul eax, eax
    add [inky_distance_right], eax

    popa 
    mov esp, ebp
    pop ebp
    ret
inky_distance_right_target endp

inky_distance_right_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call inky_distance_right_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and inky (inky_y_coord++)
; inky_distance_down = (pacman_x_coord - inky_x_coord) ^ 2 + (pacman_y_coord - inky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - inky_x_coord
; arg4 - inky_y_coord
inky_distance_down_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; inky_x_coord
    sub eax, ebx
    imul eax, eax
    mov [inky_distance_down], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; inky_y_coord
    add ebx, 1
    sub ebx, eax
    imul ebx, ebx
    add [inky_distance_down], ebx

    popa 
    mov esp, ebp
    pop ebp
    ret
inky_distance_down_target endp

inky_distance_down_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call inky_distance_down_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and inky (inky_x_coord--)
; inky_distance_left = (pacman_x_coord - inky_x_coord) ^ 2 + (pacman_y_coord - inky_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - inky_x_coord
; arg4 - inky_y_coord
inky_distance_left_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; inky_x_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [inky_distance_left], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; inky_y_coord
    sub ebx, eax
    imul ebx, ebx
    add [inky_distance_left], ebx

    popa
    mov esp, ebp
    pop ebp
    ret
inky_distance_left_target endp

inky_distance_left_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call inky_distance_left_target
    add esp, 16
endm

; procedure to check the collision beetween inky and square if inky_direction = 2 (down)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
inky_down_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov inky_collision_down_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, 30
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov inky_collision_down_check, 1
coll:
    add edi, 4
    loop loop_col


    popa
    mov esp, ebp
    pop ebp
    ret
inky_down_collision endp

inky_down_collision_macro macro area, x, y
    push y
    push x
    push area
    call inky_down_collision
    add esp, 12 
endm

; procedure to check the collision beetween inky and square if inky_direction = 3 (left)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
inky_left_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov inky_collision_left_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    sub eax, 1
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov inky_collision_left_check, 1
coll:
    loop loop_row	


    popa
    mov esp, ebp
    pop ebp
    ret
inky_left_collision endp

inky_left_collision_macro macro area, x, y
    push y
    push x
    push area
    call inky_left_collision
    add esp, 12
endm

; procedure to check the collision beetween inky and square if inky_direction = 0 (up)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
inky_up_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov inky_collision_up_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, 1
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov inky_collision_up_check, 1
coll:
    add edi, 4
    loop loop_col

    popa
    mov esp, ebp
    pop ebp
    ret
inky_up_collision endp

inky_up_collision_macro macro area, x, y
    push y
    push x
    push area
    call inky_up_collision
    add esp, 12
endm

; procedure to check the collision beetween inky and square if inky_direction = 1 (right)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
inky_right_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov inky_collision_right_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    add eax, 30
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov inky_collision_right_check, 1
coll:
    loop loop_row
    popa
    mov esp, ebp
    pop ebp
    ret
inky_right_collision endp

inky_right_collision_macro macro area, x, y
    push y
    push x
    push area
    call inky_right_collision
    add esp, 12
endm

;procedure for movement of inky
inky_movement proc
    push ebp 
    mov ebp, esp 
    pusha


    cmp inky_direction, 0
    je up_direction
    cmp inky_direction, 1
    je right_direction
    cmp inky_direction, 2
    je down_direction
    cmp inky_direction, 3
    je left_direction

up_direction:

    inky_left_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_left_check, 1
    je left_collision1
    sub inky_x_coord, 3
    mov inky_direction, 3
    jmp end_if

left_collision1:

    inky_right_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_right_check, 1
    je right_collision1
    add inky_x_coord, 3
    mov inky_direction, 1
    jmp end_if

right_collision1:

    inky_up_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_up_check, 1
    je up_collision1
    sub inky_y_coord, 3
    mov inky_direction, 0
    jmp end_if

up_collision1:

    jmp end_if

right_direction:

    inky_up_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_up_check, 1
    je up_collision2
    sub inky_y_coord, 3
    mov inky_direction, 0
    jmp end_if

up_collision2:

    inky_right_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_right_check, 1
    je right_collision2
    add inky_x_coord, 3
    mov inky_direction, 1
    jmp end_if

right_collision2:

    inky_down_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_down_check, 1
    je down_collision2
    add inky_y_coord, 3
    mov inky_direction, 2
    jmp end_if

down_collision2:

    jmp end_if

down_direction:

    inky_down_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_down_check, 1
    je down_collision3
    add inky_y_coord, 3
    mov inky_direction, 2
    jmp end_if

down_collision3:

    inky_left_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_left_check, 1
    je left_collision3
    sub inky_x_coord, 3
    mov inky_direction, 3
    jmp end_if

left_collision3:

    inky_right_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_right_check, 1
    je right_collision3
    add inky_x_coord, 3
    mov inky_direction, 1
    jmp end_if

right_collision3:

    jmp end_if

left_direction:

    inky_down_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_down_check, 1
    je down_collision4
    add inky_y_coord, 3
    mov inky_direction, 2
    jmp end_if

down_collision4:

    inky_left_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_left_check, 1
    je left_collision4
    sub inky_x_coord, 3
    mov inky_direction, 3
    jmp end_if

left_collision4:

    inky_up_collision_macro area, inky_x_coord, inky_y_coord
    cmp inky_collision_up_check, 1
    je up_collision4
    sub inky_y_coord, 3
    mov inky_direction, 0
    jmp end_if

up_collision4:


    jmp end_if

end_if:

    popa 
    mov esp, ebp
    pop ebp
    ret
inky_movement endp

inky_movement_macro macro 
    call inky_movement
endm

;procedure that returns the minimum beetween four values to minimum value
; arg1 - first value
; arg2 - second value
; arg3 - third value
; arg4 - fourth value
inky_chase_mode proc 
    push ebp 
    mov ebp, esp
    pusha

    inky_distance_up_target_macro pacman_x_coord, pacman_y_coord, inky_x_coord, inky_y_coord
    inky_distance_right_target_macro pacman_x_coord, pacman_y_coord, inky_x_coord, inky_y_coord
    inky_distance_down_target_macro pacman_x_coord, pacman_y_coord, inky_x_coord, inky_y_coord
    inky_distance_left_target_macro pacman_x_coord, pacman_y_coord, inky_x_coord, inky_y_coord


    mov eax, inky_distance_up ; first value
    mov ebx, inky_distance_right ; second value
    mov ecx, inky_distance_down ; third value
    mov edx, inky_distance_left ; fourth value

    push eax
    push ebx
    push ecx
    push edx

    cmp ebx, eax
    jl swap1
    jmp compare1
swap1:
    xchg eax, ebx
compare1:
    cmp ecx, eax
    jl swap2
    jmp compare2
swap2:
    xchg eax, ecx
compare2:
    cmp edx, eax
    jl swap3
    jmp compare3
swap3:
    xchg eax, edx
compare3:
    cmp ecx, ebx
    jl swap4
    jmp compare4
swap4:
    xchg ebx, ecx
compare4:
    cmp edx, ebx
    jl swap5
    jmp compare5
swap5:
    xchg ebx, edx
compare5:
    cmp edx, ecx
    jl swap6
    jmp compare6
swap6:
    xchg ecx, edx
compare6:


    mov inky_first_min, eax
    mov inky_second_min, ebx
    mov inky_third_min, ecx
    mov inky_fourth_min, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    

    inky_up_collision_macro area, inky_x_coord, inky_y_coord
    inky_right_collision_macro area, inky_x_coord, inky_y_coord
    inky_down_collision_macro area, inky_x_coord, inky_y_coord
    inky_left_collision_macro area, inky_x_coord, inky_y_coord

    cmp inky_first_min, eax
    je up
tag1:
    cmp inky_first_min, ebx
    je right 
tag2:
    cmp inky_first_min, ecx
    je down 
tag3:
    cmp inky_first_min, edx
    je left

    jmp next_min

up:
    cmp inky_collision_up_check, 1
    je tag1 
    cmp inky_direction, 2
    je tag1
    mov inky_direction, 0 
    sub inky_y_coord, 3
    jmp end_if1
right:
    cmp inky_collision_right_check, 1
    je tag2
    cmp inky_direction, 3
    je tag2
    mov inky_direction, 1
    add inky_x_coord, 3
    jmp end_if1 
down:
    cmp inky_collision_down_check, 1
    je tag3
    cmp inky_direction, 0
    je tag3
    mov inky_direction, 2
    add inky_y_coord, 3
    jmp end_if1
left:
    cmp inky_collision_left_check, 1
    je next_min
    cmp inky_direction, 1
    je next_min
    mov inky_direction, 3
    sub inky_x_coord, 3
    jmp end_if1
end_if1:
    jmp end_if

next_min:

    cmp inky_second_min, eax
    je up2
tag4:
    cmp inky_second_min, ebx
    je right2
tag5:
    cmp inky_second_min, ecx
    je down2
tag6:
    cmp inky_second_min, edx
    je left2

    jmp next_min2

up2:
    cmp inky_collision_up_check, 1
    je tag4
    cmp inky_direction, 2
    je tag4
    mov inky_direction, 0
    sub inky_y_coord, 3
    jmp end_if2
right2:
    cmp inky_collision_right_check, 1
    je tag5
    cmp inky_direction, 3
    je tag5
    mov inky_direction, 1
    add inky_x_coord, 3
    jmp end_if2
down2:
    cmp inky_collision_down_check, 1
    je tag6
    cmp inky_direction, 0
    je tag6
    mov inky_direction, 2
    add inky_y_coord, 3
    jmp end_if2
left2:
    cmp inky_collision_left_check, 1
    je next_min2
    cmp inky_direction, 1
    je next_min2
    mov inky_direction, 3
    sub inky_x_coord, 3
    jmp end_if2
end_if2:
    jmp end_if

next_min2:

    cmp inky_third_min, eax
    je up3
tag7:
    cmp inky_third_min, ebx
    je right3
tag8:
    cmp inky_third_min, ecx
    je down3
tag9:
    cmp inky_third_min, edx
    je left3

    jmp next_min3

up3:
    cmp inky_collision_up_check, 1
    je tag7
    cmp inky_direction, 2
    je tag7
    mov inky_direction, 0
    sub inky_y_coord, 3
    jmp end_if3
right3:
    cmp inky_collision_right_check, 1
    je tag8
    cmp inky_direction, 3
    je tag8
    mov inky_direction, 1
    add inky_x_coord, 3
    jmp end_if3
down3:
    cmp inky_collision_down_check, 1
    je tag9
    cmp inky_direction, 0
    je tag9
    mov inky_direction, 2
    add inky_y_coord, 3
    jmp end_if3
left3:
    cmp inky_collision_left_check, 1
    je next_min3
    cmp inky_direction, 1
    je next_min3
    mov inky_direction, 3
    sub inky_x_coord, 3
    jmp end_if3
end_if3:
    jmp end_if

next_min3:

    cmp inky_fourth_min, eax
    je up4
tag10:
    cmp inky_fourth_min, ebx
    je right4
tag11:
    cmp inky_fourth_min, ecx
    je down4
tag12:
    cmp inky_fourth_min, edx
    je left4

    jmp end_if

up4:
    cmp inky_collision_up_check, 1
    je tag10
    cmp inky_direction, 2
    je tag10
    mov inky_direction, 0
    sub inky_y_coord, 3
    jmp end_if4
right4:
    cmp inky_collision_right_check, 1
    je tag11
    cmp inky_direction, 3
    je tag11
    mov inky_direction, 1
    add inky_x_coord, 3
    jmp end_if4
down4:
    cmp inky_collision_down_check, 1
    je tag12
    cmp inky_direction, 0
    je tag12
    mov inky_direction, 2
    add inky_y_coord, 3
    jmp end_if4
left4:
    cmp inky_collision_left_check, 1
    je end_if
    cmp inky_direction, 1
    je end_if
    mov inky_direction, 3
    sub inky_x_coord, 3
    jmp end_if4
end_if4:
    jmp end_if

end_if:
    popa 
    mov esp, ebp
    pop ebp
    ret
inky_chase_mode endp

inky_chase_mode_macro macro x, y, z, t
    call inky_chase_mode
endm

; procedure that calculates distance beetwen pacman and clyde (clyde_y_coord--)
; clyde_distance_up = (pacman_x_coord - clyde_x_coord) ^ 2 + (pacman_y_coord - clyde_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - clyde_x_coord
; arg4 - clyde_y_coord
clyde_distance_up_target proc
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; clyde_x_coord
    sub eax, ebx
    imul eax, eax
    mov [clyde_distance_up], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; clyde_y_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    add [clyde_distance_up], eax

    popa
    mov esp, ebp
    pop ebp
    ret 
clyde_distance_up_target endp

clyde_distance_up_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call clyde_distance_up_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and clyde (clyde_x_coord++)
; clyde_distance_right = (pacman_x_coord - clyde_x_coord) ^ 2 + (pacman_y_coord - clyde_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - clyde_x_coord
; arg4 - clyde_y_coord
clyde_distance_right_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; clyde_x_coord
    add ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [clyde_distance_right], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; clyde_y_coord
    sub eax, ebx
    imul eax, eax
    add [clyde_distance_right], eax

    popa 
    mov esp, ebp
    pop ebp
    ret
clyde_distance_right_target endp

clyde_distance_right_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call clyde_distance_right_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and clyde (clyde_y_coord++)
; clyde_distance_down = (pacman_x_coord - clyde_x_coord) ^ 2 + (pacman_y_coord - clyde_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - clyde_x_coord
; arg4 - clyde_y_coord
clyde_distance_down_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; clyde_x_coord
    sub eax, ebx
    imul eax, eax
    mov [clyde_distance_down], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; clyde_y_coord
    add ebx, 1
    sub ebx, eax
    imul ebx, ebx
    add [clyde_distance_down], ebx

    popa 
    mov esp, ebp
    pop ebp
    ret
clyde_distance_down_target endp

clyde_distance_down_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call clyde_distance_down_target
    add esp, 16
endm

; procedure that calculates distance beetwen pacman and clyde (clyde_x_coord--)
; clyde_distance_left = (pacman_x_coord - clyde_x_coord) ^ 2 + (pacman_y_coord - clyde_y_coord) ^ 2
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
; arg3 - clyde_x_coord
; arg4 - clyde_y_coord
clyde_distance_left_target proc 
    push ebp 
    mov ebp, esp
    pusha

    mov eax, [ebp + arg1] ; pacman_x_coord
    mov ebx, [ebp + arg3] ; clyde_x_coord
    sub ebx, 1
    sub eax, ebx
    imul eax, eax
    mov [clyde_distance_left], eax
    mov eax, [ebp + arg2] ; pacman_y_coord
    mov ebx, [ebp + arg4] ; clyde_y_coord
    sub ebx, eax
    imul ebx, ebx
    add [clyde_distance_left], ebx

    popa
    mov esp, ebp
    pop ebp
    ret
clyde_distance_left_target endp

clyde_distance_left_target_macro macro x, y, z, t
    push t
    push z
    push y
    push x
    call clyde_distance_left_target
    add esp, 16
endm

; procedure to check the collision beetween clyde and square if clyde_direction = 2 (down)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
clyde_down_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov clyde_collision_down_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, 30
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov clyde_collision_down_check, 1
coll:
    add edi, 4
    loop loop_col


    popa
    mov esp, ebp
    pop ebp
    ret
clyde_down_collision endp

clyde_down_collision_macro macro area, x, y
    push y
    push x
    push area
    call clyde_down_collision
    add esp, 12 
endm

; procedure to check the collision beetween clyde and square if clyde_direction = 3 (left)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
clyde_left_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov clyde_collision_left_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    sub eax, 1
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov clyde_collision_left_check, 1
coll:
    loop loop_row	


    popa
    mov esp, ebp
    pop ebp
    ret
clyde_left_collision endp

clyde_left_collision_macro macro area, x, y
    push y
    push x
    push area
    call clyde_left_collision
    add esp, 12
endm

; procedure to check the collision beetween clyde and square if clyde_direction = 0 (up)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
clyde_up_collision proc
    push ebp 
    mov ebp, esp
    pusha

    mov clyde_collision_up_check, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, 1
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov clyde_collision_up_check, 1
coll:
    add edi, 4
    loop loop_col

    popa
    mov esp, ebp
    pop ebp
    ret
clyde_up_collision endp

clyde_up_collision_macro macro area, x, y
    push y
    push x
    push area
    call clyde_up_collision
    add esp, 12
endm

; procedure to check the collision beetween clyde and square if clyde_direction = 1 (right)
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
clyde_right_collision proc
    push ebp 
    mov ebp, esp
    pusha

	mov clyde_collision_right_check, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    add eax, 30
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov clyde_collision_right_check, 1
coll:
    loop loop_row
    popa
    mov esp, ebp
    pop ebp
    ret
clyde_right_collision endp

clyde_right_collision_macro macro area, x, y
    push y
    push x
    push area
    call clyde_right_collision
    add esp, 12
endm

;procedure for movement of clyde
clyde_movement proc
    push ebp 
    mov ebp, esp 
    pusha


    cmp clyde_direction, 0
    je up_direction
    cmp clyde_direction, 1
    je right_direction
    cmp clyde_direction, 2
    je down_direction
    cmp clyde_direction, 3
    je left_direction

up_direction:

    clyde_right_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_right_check, 1
    je right_collision1
    add clyde_x_coord, 3
    mov clyde_direction, 1
    jmp end_if

right_collision1:

    clyde_left_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_left_check, 1
    je left_collision1
    sub clyde_x_coord, 3
    mov clyde_direction, 3
    jmp end_if

left_collision1:

    clyde_up_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_up_check, 1
    je up_collision1
    sub clyde_y_coord, 3
    mov clyde_direction, 0
    jmp end_if

up_collision1:

    jmp end_if

right_direction:

    clyde_down_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_down_check, 1
    je down_collision2
    add clyde_y_coord, 3
    mov clyde_direction, 2
    jmp end_if

down_collision2:

    clyde_right_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_right_check, 1
    je right_collision2
    add clyde_x_coord, 3
    mov clyde_direction, 1
    jmp end_if

right_collision2:

    clyde_up_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_up_check, 1
    je up_collision2
    sub clyde_y_coord, 3
    mov clyde_direction, 0
    jmp end_if

up_collision2:

    jmp end_if

down_direction:

    clyde_down_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_down_check, 1
    je down_collision3
    add clyde_y_coord, 3
    mov clyde_direction, 2
    jmp end_if

down_collision3:

    clyde_right_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_right_check, 1
    je right_collision3
    add clyde_x_coord, 3
    mov clyde_direction, 1
    jmp end_if

right_collision3:


    clyde_left_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_left_check, 1
    je left_collision3
    sub clyde_x_coord, 3
    mov clyde_direction, 3
    jmp end_if

left_collision3:

    jmp end_if

left_direction:

    clyde_up_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_up_check, 1
    je up_collision4
    sub clyde_y_coord, 3
    mov clyde_direction, 0
    jmp end_if

up_collision4:

    clyde_down_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_down_check, 1
    je down_collision4
    add clyde_y_coord, 3
    mov clyde_direction, 2
    jmp end_if

down_collision4:

    clyde_left_collision_macro area, clyde_x_coord, clyde_y_coord
    cmp clyde_collision_left_check, 1
    je left_collision4
    sub clyde_x_coord, 3
    mov clyde_direction, 3
    jmp end_if

left_collision4:

    jmp end_if

end_if:

    popa 
    mov esp, ebp
    pop ebp
    ret
clyde_movement endp

clyde_movement_macro macro 
    call clyde_movement
endm

;procedure that returns the minimum beetween four values to minimum value
; arg1 - first value
; arg2 - second value
; arg3 - third value
; arg4 - fourth value
clyde_chase_mode proc 
    push ebp 
    mov ebp, esp
    pusha

    clyde_distance_up_target_macro pacman_x_coord, pacman_y_coord, clyde_x_coord, clyde_y_coord
    clyde_distance_right_target_macro pacman_x_coord, pacman_y_coord, clyde_x_coord, clyde_y_coord
    clyde_distance_down_target_macro pacman_x_coord, pacman_y_coord, clyde_x_coord, clyde_y_coord
    clyde_distance_left_target_macro pacman_x_coord, pacman_y_coord, clyde_x_coord, clyde_y_coord


    mov eax, clyde_distance_up ; first value
    mov ebx, clyde_distance_right ; second value
    mov ecx, clyde_distance_down ; third value
    mov edx, clyde_distance_left ; fourth value

    push eax
    push ebx
    push ecx
    push edx

    cmp ebx, eax
    jl swap1
    jmp compare1
swap1:
    xchg eax, ebx
compare1:
    cmp ecx, eax
    jl swap2
    jmp compare2
swap2:
    xchg eax, ecx
compare2:
    cmp edx, eax
    jl swap3
    jmp compare3
swap3:
    xchg eax, edx
compare3:
    cmp ecx, ebx
    jl swap4
    jmp compare4
swap4:
    xchg ebx, ecx
compare4:
    cmp edx, ebx
    jl swap5
    jmp compare5
swap5:
    xchg ebx, edx
compare5:
    cmp edx, ecx
    jl swap6
    jmp compare6
swap6:
    xchg ecx, edx
compare6:


    mov clyde_first_min, eax
    mov clyde_second_min, ebx
    mov clyde_third_min, ecx
    mov clyde_fourth_min, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    

    clyde_up_collision_macro area, clyde_x_coord, clyde_y_coord
    clyde_right_collision_macro area, clyde_x_coord, clyde_y_coord
    clyde_down_collision_macro area, clyde_x_coord, clyde_y_coord
    clyde_left_collision_macro area, clyde_x_coord, clyde_y_coord

    cmp clyde_first_min, eax
    je up
tag1:
    cmp clyde_first_min, ebx
    je right 
tag2:
    cmp clyde_first_min, ecx
    je down 
tag3:
    cmp clyde_first_min, edx
    je left

    jmp next_min

up:
    cmp clyde_collision_up_check, 1
    je tag1 
    cmp clyde_direction, 2
    je tag1
    mov clyde_direction, 0 
    sub clyde_y_coord, 3
    jmp end_if1
right:
    cmp clyde_collision_right_check, 1
    je tag2
    cmp clyde_direction, 3
    je tag2
    mov clyde_direction, 1
    add clyde_x_coord, 3
    jmp end_if1 
down:
    cmp clyde_collision_down_check, 1
    je tag3
    cmp clyde_direction, 0
    je tag3
    mov clyde_direction, 2
    add clyde_y_coord, 3
    jmp end_if1
left:
    cmp clyde_collision_left_check, 1
    je next_min
    cmp clyde_direction, 1
    je next_min
    mov clyde_direction, 3
    sub clyde_x_coord, 3
    jmp end_if1
end_if1:
    jmp end_if

next_min:

    cmp clyde_second_min, eax
    je up2
tag4:
    cmp clyde_second_min, ebx
    je right2
tag5:
    cmp clyde_second_min, ecx
    je down2
tag6:
    cmp clyde_second_min, edx
    je left2

    jmp next_min2

up2:
    cmp clyde_collision_up_check, 1
    je tag4
    cmp clyde_direction, 2
    je tag4
    mov clyde_direction, 0
    sub clyde_y_coord, 3
    jmp end_if2
right2:
    cmp clyde_collision_right_check, 1
    je tag5
    cmp clyde_direction, 3
    je tag5
    mov clyde_direction, 1
    add clyde_x_coord, 3
    jmp end_if2
down2:
    cmp clyde_collision_down_check, 1
    je tag6
    cmp clyde_direction, 0
    je tag6
    mov clyde_direction, 2
    add clyde_y_coord, 3
    jmp end_if2
left2:
    cmp clyde_collision_left_check, 1
    je next_min2
    cmp clyde_direction, 1
    je next_min2
    mov clyde_direction, 3
    sub clyde_x_coord, 3
    jmp end_if2
end_if2:
    jmp end_if

next_min2:

    cmp clyde_third_min, eax
    je up3
tag7:
    cmp clyde_third_min, ebx
    je right3
tag8:
    cmp clyde_third_min, ecx
    je down3
tag9:
    cmp clyde_third_min, edx
    je left3

    jmp next_min3

up3:
    cmp clyde_collision_up_check, 1
    je tag7
    cmp clyde_direction, 2
    je tag7
    mov clyde_direction, 0
    sub clyde_y_coord, 3
    jmp end_if3
right3:
    cmp clyde_collision_right_check, 1
    je tag8
    cmp clyde_direction, 3
    je tag8
    mov clyde_direction, 1
    add clyde_x_coord, 3
    jmp end_if3
down3:
    cmp clyde_collision_down_check, 1
    je tag9
    cmp clyde_direction, 0
    je tag9
    mov clyde_direction, 2
    add clyde_y_coord, 3
    jmp end_if3
left3:
    cmp clyde_collision_left_check, 1
    je next_min3
    cmp clyde_direction, 1
    je next_min3
    mov clyde_direction, 3
    sub clyde_x_coord, 3
    jmp end_if3
end_if3:
    jmp end_if

next_min3:

    cmp clyde_fourth_min, eax
    je up4
tag10:
    cmp clyde_fourth_min, ebx
    je right4
tag11:
    cmp clyde_fourth_min, ecx
    je down4
tag12:
    cmp clyde_fourth_min, edx
    je left4

    jmp end_if

up4:
    cmp clyde_collision_up_check, 1
    je tag10
    cmp clyde_direction, 2
    je tag10
    mov clyde_direction, 0
    sub clyde_y_coord, 3
    jmp end_if4
right4:
    cmp clyde_collision_right_check, 1
    je tag11
    cmp clyde_direction, 3
    je tag11
    mov clyde_direction, 1
    add clyde_x_coord, 3
    jmp end_if4
down4:
    cmp clyde_collision_down_check, 1
    je tag12
    cmp clyde_direction, 0
    je tag12
    mov clyde_direction, 2
    add clyde_y_coord, 3
    jmp end_if4
left4:
    cmp clyde_collision_left_check, 1
    je end_if
    cmp clyde_direction, 1
    je end_if
    mov clyde_direction, 3
    sub clyde_x_coord, 3
    jmp end_if4
end_if4:
    jmp end_if

end_if:
    popa 
    mov esp, ebp
    pop ebp
    ret
clyde_chase_mode endp

clyde_chase_mode_macro macro x, y, z, t
    call clyde_chase_mode
endm

; procedura make_text afiseaza o litera sau o cifra la coordonatele date
; arg1 - simbolul de afisat (litera sau cifra)
; arg2 - pointer la vectorul de pixeli
; arg3 - pos_x
; arg4 - pos_y
make_text proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1] ; citim simbolul de afisat
	cmp eax, 'A'
	jl make_digit
	cmp eax, 'Z'
	jg make_digit
	sub eax, 'A'
	lea esi, letters
	jmp draw_text
make_digit:
	cmp eax, '0'
	jl make_space
	cmp eax, '9'
	jg make_space
	sub eax, '0'
	lea esi, digits
	jmp draw_text
make_space:	
	mov eax, 26 ; de la 0 pana la 25 sunt litere, 26 e space
	lea esi, letters
	
draw_text:
	mov ebx, symbol_width
	mul ebx
	mov ebx, symbol_height
	mul ebx
	add esi, eax
	mov ecx, symbol_height
bucla_simbol_linii:
	mov edi, [ebp+arg2] ; pointer la matricea de pixeli
	mov eax, [ebp+arg4] ; pointer la coord y
	add eax, symbol_height
	sub eax, ecx
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg3] ; pointer la coord x
	shl eax, 2 ; inmultim cu 4, avem un DWORD per pixel
	add edi, eax
	push ecx
	mov ecx, symbol_width
bucla_simbol_coloane:
	cmp byte ptr [esi], 0
	je simbol_pixel_alb
	mov dword ptr [edi], 0FFFFFFh
	jmp simbol_pixel_next
simbol_pixel_alb:
	mov dword ptr [edi], 0
simbol_pixel_next:
	inc esi
	add edi, 4
	loop bucla_simbol_coloane
	pop ecx
	loop bucla_simbol_linii
	popa
	mov esp, ebp
	pop ebp
	ret
make_text endp

; un macro ca sa apelam mai usor desenarea simbolului
make_text_macro macro symbol, drawArea, x, y
	push y
	push x
	push drawArea
	push symbol
	call make_text
	add esp, 16
endm

; procedure to check the collision beetween the player and square if D_pressed
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
collision_D_pressed proc
    push ebp 
    mov ebp, esp
    pusha


	mov pacman_right_collision, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    add eax, 30
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pacman_right_collision, 1
coll:
    cmp dword ptr [edi], 0FFFF00h
    jne coll2
    mov check_coin, 1
coll2:
    loop loop_row	
	cmp pacman_right_collision, 1
	je not_coll
    cmp pacman_next_direction, 1
    jne not_coll
	mov pacman_direction, 1
not_coll: 

    cmp pacman_right_collision, 1
    je no_direction
    cmp pacman_direction, 1
    jne no_direction
    add pacman_x_coord, 3
no_direction:

    cmp check_coin, 1
    jne no_coin 
    add score, 1
    mov check_coin, 0

    mov ecx, character_height
loop_row2:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    add eax, 30
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, coin_length
loop_col2:
    mov dword ptr [edi], 0
    add edi, 4
    loop loop_col2
    pop ecx
    loop loop_row2
no_coin:


    popa
    mov esp, ebp
    pop ebp
    ret
collision_D_pressed endp

collision_D_pressed_macro macro area, x, y
    push y
    push x
    push area
    call collision_D_pressed
    add esp, 12
endm

; procedure to check the collision beetween the player and square if W_pressed
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
collision_W_pressed proc
    push ebp 
    mov ebp, esp
    pusha

    mov pacman_up_collision, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, 1
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pacman_up_collision, 1
coll:
    cmp dword ptr [edi], 0FFFF00h
    jne coll2
    mov check_coin, 1
coll2:
    cmp dword ptr [edi], 000FF00h
    jne coll3
    mov check_power, 1
coll3:
    add edi, 4
    loop loop_col
    cmp pacman_up_collision, 1
    je not_coll 
    cmp pacman_next_direction, 0
    jne not_coll
    mov pacman_direction, 0
not_coll:

    cmp pacman_up_collision, 1
    je no_direction
    cmp pacman_direction, 0
    jne no_direction
    sub pacman_y_coord, 3
no_direction:

    cmp check_coin, 1
    jne no_coin
    add score, 1
    mov check_coin, 0

    mov ecx, coin_length
loop_row2:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col2:
    mov dword ptr [edi], 0
    add edi, 4
    loop loop_col2
    pop ecx
    loop loop_row2
no_coin:

    cmp check_power, 1
    jne no_power
    mov power_timer, 0
    mov blinky_ghost_mode, 1
    mov pinky_ghost_mode, 1
    mov inky_ghost_mode, 1
    mov clyde_ghost_mode, 1
    mov check_power, 0

    mov ecx, power_lenght
loop_row3:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col3:
    mov dword ptr [edi], 0
    add edi, 4
    loop loop_col3
    pop ecx
    loop loop_row3
no_power:


    popa
    mov esp, ebp
    pop ebp
    ret
collision_W_pressed endp

collision_W_pressed_macro macro area, x, y
    push y
    push x
    push area
    call collision_W_pressed
    add esp, 12
endm

; procedure to check the collision beetween the player and square if A_pressed
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
collision_A_pressed proc
    push ebp 
    mov ebp, esp
    pusha

	mov pacman_left_collision, 0
    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    sub eax, 1
    shl eax, 2
    add edi, eax
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pacman_left_collision, 1
coll:
    cmp dword ptr [edi], 0FFFF00h
    jne coll2
    mov check_coin, 1
coll2:
    loop loop_row	
	cmp pacman_left_collision, 1
	je not_coll
    cmp pacman_next_direction, 3
    jne not_coll
	mov pacman_direction, 3
not_coll: 

    cmp pacman_left_collision, 1
    je no_direction
    cmp pacman_direction, 3
    jne no_direction
    sub pacman_x_coord, 3
no_direction:

    cmp check_coin, 1
    jne no_coin
    add score, 1
    mov check_coin, 0

    mov ecx, character_height
loop_row2:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    sub eax, coin_length
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, coin_length
loop_col2:
    mov dword ptr [edi], 0
    add edi, 4
    loop loop_col2
    pop ecx
    loop loop_row2
no_coin:

    popa
    mov esp, ebp
    pop ebp
    ret
collision_A_pressed endp

collision_A_pressed_macro macro area, x, y
    push y
    push x
    push area
    call collision_A_pressed
    add esp, 12
endm

; procedure to check the collision beetween the player and square if S_pressed
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
collision_S_pressed proc
    push ebp 
    mov ebp, esp
    pusha

    mov pacman_down_collision, 0

    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, 30
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    mov ecx, square_length 
loop_col:
    cmp dword ptr [edi], 00000FFh
    jne coll
    mov pacman_down_collision, 1
coll:
    cmp dword ptr [edi], 0FFFF00h
    jne coll2
    mov check_coin, 1
coll2:
    cmp dword ptr [edi], 000FF00h
    jne coll3
    mov check_power, 1
coll3:
    add edi, 4
    loop loop_col
    cmp pacman_down_collision, 1
    je not_coll 
    cmp pacman_next_direction, 2
    jne not_coll
    mov pacman_direction, 2
not_coll:

    cmp pacman_down_collision, 1 
    je no_direction
    cmp pacman_direction, 2
    jne no_direction
    add pacman_y_coord, 3
no_direction:

    cmp check_coin, 1
    jne no_coin 
    add score, 1
    mov check_coin, 0

    mov ecx, coin_length
loop_row2:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    add eax, coin_length
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col2:
    mov dword ptr [edi], 0
    add edi, 4
    loop loop_col2
    pop ecx
    loop loop_row2
no_coin:

    cmp check_power, 1
    jne no_power
    mov blinky_ghost_mode, 1
    mov pinky_ghost_mode, 1
    mov inky_ghost_mode, 1
    mov clyde_ghost_mode, 1
    mov power_timer, 0
    mov check_power, 0

    mov ecx, power_lenght
loop_row3:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    add eax, power_lenght
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col3:
    mov dword ptr [edi], 0
    add edi, 4
    loop loop_col3
    pop ecx
    loop loop_row3
no_power:

    popa
    mov esp, ebp
    pop ebp
    ret
collision_S_pressed endp

collision_S_pressed_macro macro area, x, y
    push y
    push x
    push area
    call collision_S_pressed
    add esp, 12 
endm

; procedure to display a square
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
power proc 
    push ebp
    mov ebp, esp
    pusha

    mov ecx, power_lenght
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, power_lenght
    sub eax, ecx
    mov ebx, area_width
    mul ebx 
    add eax, [ebp + arg2]
    shl eax, 2
    add edi, eax 
    push ecx 
    mov ecx, power_lenght
loop_col:

	mov dword ptr [edi], 000FF00h
    add edi, 4 
	add esi, 4
    loop loop_col
    pop ecx 
    loop loop_row

    popa 
    mov esp, ebp
    pop ebp
    ret     
power endp

power_macro macro area, x, y
    push y 
    push x 
    push area 
    call power
    add esp, 12
endm

; procedure to display a square
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
coin proc 
    push ebp
    mov ebp, esp
    pusha

    mov ecx, coin_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, coin_length
    sub eax, ecx
    mov ebx, area_width
    mul ebx 
    add eax, [ebp + arg2]
    shl eax, 2
    add edi, eax 
    push ecx 
    mov ecx, coin_length
loop_col:

	mov dword ptr [edi], 0FFFF00h
    add edi, 4 
	add esi, 4
    loop loop_col
    pop ecx 
    loop loop_row

    popa 
    mov esp, ebp
    pop ebp
    ret     
coin endp

coin_macro macro area, x, y
    push y 
    push x 
    push area 
    call coin
    add esp, 12
endm

; procedure to display a square
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
square proc 
    push ebp
    mov ebp, esp
    pusha

    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width
    mul ebx 
    add eax, [ebp + arg2]
    shl eax, 2
    add edi, eax 
    push ecx 
    mov ecx, square_length
loop_col:
	mov dword ptr [edi], 00000FFh
    add edi, 4 
    loop loop_col
    pop ecx 
    loop loop_row

    popa 
    mov esp, ebp
    pop ebp
    ret     
square endp

square_macro macro area, x, y
    push y 
    push x 
    push area 
    call square
    add esp, 12
endm

; procedure to display a black square
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
black proc 
    push ebp
    mov ebp, esp
    pusha

    mov ecx, square_length
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, square_length
    sub eax, ecx
    mov ebx, area_width
    mul ebx 
    add eax, [ebp + arg2]
    shl eax, 2
    add edi, eax 
    push ecx 
    mov ecx, square_length
loop_col:
	mov dword ptr [edi], 0
    add edi, 4 
    loop loop_col
    pop ecx 
    loop loop_row

    popa 
    mov esp, ebp
    pop ebp
    ret     
black endp

black_macro macro area, x, y
    push y 
    push x 
    push area 
    call black
    add esp, 12
endm

; procedure to check collision beetween pacman and coin
; arg1 - pacman_x_coord
; arg2 - pacman_y_coord
coin_collision proc 
    push ebp 
    mov ebp, esp
    pusha 

    mov ecx, character_width
loop_row:
    mov eax, [ebp + arg1]
    add eax, character_width
    sub eax, ecx
    push ecx 
    mov ecx, character_height
loop_col:
    mov ebx, [ebp + arg2]
    add ebx, character_height
    sub ebx, ecx

    cmp eax, 143
    jne not_coin 
    cmp ebx, 143
    jne not_coin
    mov coin0, 1
    jmp end_if
not_coin:
    cmp eax, 149
    jne not_coin1
    cmp ebx, 149
    jne not_coin1
    mov coin0, 1
    jmp end_if
not_coin1:
    cmp eax, 173
    jne not_coin2
    cmp ebx, 143
    jne not_coin2
    mov coin1, 1
    jmp end_if
not_coin2:
    cmp eax, 179
    jne not_coin3
    cmp ebx, 149
    jne not_coin3
    mov coin1, 1
    jmp end_if
not_coin3:
    cmp eax, 203
    jne not_coin4
    cmp ebx, 143
    jne not_coin4
    mov coin2, 1
    jmp end_if
not_coin4:
    cmp eax, 209
    jne not_coin5
    cmp ebx, 149
    jne not_coin5
    mov coin2, 1
    jmp end_if
not_coin5:
    cmp eax, 233
    jne not_coin6
    cmp ebx, 143
    jne not_coin6
    mov coin3, 1
    jmp end_if
not_coin6:
    cmp eax, 239
    jne not_coin7
    cmp ebx, 149
    jne not_coin7
    mov coin3, 1
    jmp end_if
not_coin7:
    cmp eax, 263
    jne not_coin8
    cmp ebx, 143
    jne not_coin8
    mov coin4, 1
    jmp end_if
not_coin8:
    cmp eax, 269
    jne not_coin9
    cmp ebx, 149
    jne not_coin9
    mov coin4, 1
    jmp end_if
not_coin9:
    cmp eax, 293
    jne not_coin10
    cmp ebx, 143
    jne not_coin10
    mov coin5, 1
    jmp end_if
not_coin10:
    cmp eax, 299
    jne not_coin11
    cmp ebx, 149
    jne not_coin11
    mov coin5, 1
    jmp end_if
not_coin11:
    cmp eax, 323
    jne not_coin12
    cmp ebx, 143
    jne not_coin12
    mov coin6, 1
    jmp end_if
not_coin12:
    cmp eax, 329
    jne not_coin13
    cmp ebx, 149
    jne not_coin13
    mov coin6, 1
    jmp end_if
not_coin13:
    cmp eax, 353
    jne not_coin14
    cmp ebx, 143
    jne not_coin14
    mov coin7, 1
    jmp end_if
not_coin14:
    cmp eax, 359
    jne not_coin15
    cmp ebx, 149
    jne not_coin15
    mov coin7, 1
    jmp end_if
not_coin15:
    cmp eax, 383
    jne not_coin16
    cmp ebx, 143
    jne not_coin16
    mov coin8, 1
    jmp end_if
not_coin16:
    cmp eax, 389
    jne not_coin17
    cmp ebx, 149
    jne not_coin17
    mov coin8, 1
    jmp end_if
not_coin17:
    cmp eax, 413
    jne not_coin18
    cmp ebx, 143
    jne not_coin18
    mov coin9, 1
    jmp end_if
not_coin18:
    cmp eax, 419
    jne not_coin19
    cmp ebx, 149
    jne not_coin19
    mov coin9, 1
    jmp end_if
not_coin19:
    cmp eax, 443
    jne not_coin20
    cmp ebx, 143
    jne not_coin20
    mov coin10, 1
    jmp end_if
not_coin20:
    cmp eax, 449
    jne not_coin21
    cmp ebx, 149
    jne not_coin21
    mov coin10, 1
    jmp end_if
not_coin21:
    cmp eax, 473
    jne not_coin22
    cmp ebx, 143
    jne not_coin22
    mov coin11, 1
    jmp end_if
not_coin22:
    cmp eax, 479
    jne not_coin23
    cmp ebx, 149
    jne not_coin23
    mov coin11, 1
    jmp end_if
not_coin23:
    cmp eax, 503
    jne not_coin24
    cmp ebx, 143
    jne not_coin24
    mov coin12, 1
    jmp end_if
not_coin24:
    cmp eax, 509
    jne not_coin25
    cmp ebx, 149
    jne not_coin25
    mov coin12, 1
    jmp end_if
not_coin25:
    cmp eax, 533
    jne not_coin26
    cmp ebx, 143
    jne not_coin26
    mov coin13, 1
    jmp end_if
not_coin26:
    cmp eax, 539
    jne not_coin27
    cmp ebx, 149
    jne not_coin27
    mov coin13, 1
    jmp end_if
not_coin27:
    cmp eax, 563
    jne not_coin28
    cmp ebx, 143
    jne not_coin28
    mov coin14, 1
    jmp end_if
not_coin28:
    cmp eax, 569
    jne not_coin29
    cmp ebx, 149
    jne not_coin29
    mov coin14, 1
    jmp end_if
not_coin29:
    cmp eax, 593
    jne not_coin30
    cmp ebx, 143
    jne not_coin30
    mov coin15, 1
    jmp end_if
not_coin30:
    cmp eax, 599
    jne not_coin31
    cmp ebx, 149
    jne not_coin31
    mov coin15, 1
    jmp end_if
not_coin31:
    cmp eax, 623
    jne not_coin32
    cmp ebx, 143
    jne not_coin32
    mov coin16, 1
    jmp end_if
not_coin32:
    cmp eax, 629
    jne not_coin33
    cmp ebx, 149
    jne not_coin33
    mov coin16, 1
    jmp end_if
not_coin33:
    cmp eax, 653
    jne not_coin34
    cmp ebx, 143
    jne not_coin34
    mov coin17, 1
    jmp end_if
not_coin34:
    cmp eax, 659
    jne not_coin35
    cmp ebx, 149
    jne not_coin35
    mov coin17, 1
    jmp end_if
not_coin35:
    cmp eax, 233
    jne not_coin36
    cmp ebx, 173
    jne not_coin36
    mov coin18, 1
    jmp end_if
not_coin36:
    cmp eax, 239
    jne not_coin37
    cmp ebx, 179
    jne not_coin37
    mov coin18, 1
    jmp end_if
not_coin37:
    cmp eax, 353
    jne not_coin38
    cmp ebx, 173
    jne not_coin38
    mov coin19, 1
    jmp end_if
not_coin38:
    cmp eax, 359
    jne not_coin39
    cmp ebx, 179
    jne not_coin39
    mov coin19, 1
    jmp end_if
not_coin39:
    cmp eax, 413
    jne not_coin40
    cmp ebx, 173
    jne not_coin40
    mov coin20, 1
    jmp end_if
not_coin40:
    cmp eax, 419
    jne not_coin41
    cmp ebx, 179
    jne not_coin41
    mov coin20, 1
    jmp end_if
not_coin41:
    cmp eax, 533
    jne not_coin42
    cmp ebx, 173
    jne not_coin42
    mov coin21, 1
    jmp end_if
not_coin42:
    cmp eax, 539
    jne not_coin43
    cmp ebx, 179
    jne not_coin43
    mov coin21, 1
    jmp end_if
not_coin43:
    cmp eax, 143
    jne not_coin44
    cmp ebx, 203
    jne not_coin44
    mov coin22, 1
    jmp end_if
not_coin44:
    cmp eax, 149
    jne not_coin45
    cmp ebx, 209
    jne not_coin45
    mov coin22, 1
    jmp end_if
not_coin45:
    cmp eax, 173
    jne not_coin46
    cmp ebx, 203
    jne not_coin46
    mov coin23, 1
    jmp end_if
not_coin46:
    cmp eax, 179
    jne not_coin47
    cmp ebx, 209
    jne not_coin47
    mov coin23, 1
    jmp end_if
not_coin47:
    cmp eax, 203
    jne not_coin48
    cmp ebx, 203
    jne not_coin48
    mov coin24, 1
    jmp end_if
not_coin48:
    cmp eax, 209
    jne not_coin49
    cmp ebx, 209
    jne not_coin49
    mov coin24, 1
    jmp end_if
not_coin49:
    cmp eax, 233
    jne not_coin50
    cmp ebx, 203
    jne not_coin50
    mov coin25, 1
    jmp end_if
not_coin50:
    cmp eax, 239
    jne not_coin51
    cmp ebx, 209
    jne not_coin51
    mov coin25, 1
    jmp end_if
not_coin51:
    cmp eax, 263
    jne not_coin52
    cmp ebx, 203
    jne not_coin52
    mov coin26, 1
    jmp end_if
not_coin52:
    cmp eax, 269
    jne not_coin53
    cmp ebx, 209
    jne not_coin53
    mov coin26, 1
    jmp end_if
not_coin53:
    cmp eax, 293
    jne not_coin54
    cmp ebx, 203
    jne not_coin54
    mov coin27, 1
    jmp end_if
not_coin54:
    cmp eax, 299
    jne not_coin55
    cmp ebx, 209
    jne not_coin55
    mov coin27, 1
    jmp end_if
not_coin55:
    cmp eax, 323
    jne not_coin56
    cmp ebx, 203
    jne not_coin56
    mov coin28, 1
    jmp end_if
not_coin56:
    cmp eax, 329
    jne not_coin57
    cmp ebx, 209
    jne not_coin57
    mov coin28, 1
    jmp end_if
not_coin57:
    cmp eax, 353
    jne not_coin58
    cmp ebx, 203
    jne not_coin58
    mov coin29, 1
    jmp end_if
not_coin58:
    cmp eax, 359
    jne not_coin59
    cmp ebx, 209
    jne not_coin59
    mov coin29, 1
    jmp end_if
not_coin59:
    cmp eax, 383
    jne not_coin60
    cmp ebx, 203
    jne not_coin60
    mov coin30, 1
    jmp end_if
not_coin60:
    cmp eax, 389
    jne not_coin61
    cmp ebx, 209
    jne not_coin61
    mov coin30, 1
    jmp end_if
not_coin61:
    cmp eax, 413
    jne not_coin62
    cmp ebx, 203
    jne not_coin62
    mov coin31, 1
    jmp end_if
not_coin62:
    cmp eax, 419
    jne not_coin63
    cmp ebx, 209
    jne not_coin63
    mov coin31, 1
    jmp end_if
not_coin63:
    cmp eax, 443
    jne not_coin64
    cmp ebx, 203
    jne not_coin64
    mov coin32, 1
    jmp end_if
not_coin64:
    cmp eax, 449
    jne not_coin65
    cmp ebx, 209
    jne not_coin65
    mov coin32, 1
    jmp end_if
not_coin65:
    cmp eax, 473
    jne not_coin66
    cmp ebx, 203
    jne not_coin66
    mov coin33, 1
    jmp end_if
not_coin66:
    cmp eax, 479
    jne not_coin67
    cmp ebx, 209
    jne not_coin67
    mov coin33, 1
    jmp end_if
not_coin67:
    cmp eax, 503
    jne not_coin68
    cmp ebx, 203
    jne not_coin68
    mov coin34, 1
    jmp end_if
not_coin68:
    cmp eax, 509
    jne not_coin69
    cmp ebx, 209
    jne not_coin69
    mov coin34, 1
    jmp end_if
not_coin69:
    cmp eax, 533
    jne not_coin70
    cmp ebx, 203
    jne not_coin70
    mov coin35, 1
    jmp end_if
not_coin70:
    cmp eax, 539
    jne not_coin71
    cmp ebx, 209
    jne not_coin71
    mov coin35, 1
    jmp end_if
not_coin71:
    cmp eax, 563
    jne not_coin72
    cmp ebx, 203
    jne not_coin72
    mov coin36, 1
    jmp end_if
not_coin72:
    cmp eax, 569
    jne not_coin73
    cmp ebx, 209
    jne not_coin73
    mov coin36, 1
    jmp end_if
not_coin73:
    cmp eax, 593
    jne not_coin74
    cmp ebx, 203
    jne not_coin74
    mov coin37, 1
    jmp end_if
not_coin74:
    cmp eax, 599
    jne not_coin75
    cmp ebx, 209
    jne not_coin75
    mov coin37, 1
    jmp end_if
not_coin75:
    cmp eax, 623
    jne not_coin76
    cmp ebx, 203
    jne not_coin76
    mov coin38, 1
    jmp end_if
not_coin76:
    cmp eax, 629
    jne not_coin77
    cmp ebx, 209
    jne not_coin77
    mov coin38, 1
    jmp end_if
not_coin77:
    cmp eax, 143
    jne not_coin78
    cmp ebx, 233
    jne not_coin78
    mov coin39, 1
    jmp end_if
not_coin78:
    cmp eax, 149
    jne not_coin79
    cmp ebx, 239
    jne not_coin79
    mov coin39, 1
    jmp end_if
not_coin79:
    cmp eax, 233
    jne not_coin80
    cmp ebx, 233
    jne not_coin80
    mov coin40, 1
    jmp end_if
not_coin80:
    cmp eax, 239
    jne not_coin81
    cmp ebx, 239
    jne not_coin81
    mov coin40, 1
    jmp end_if
not_coin81:
    cmp eax, 293
    jne not_coin82
    cmp ebx, 233
    jne not_coin82
    mov coin41, 1
    jmp end_if
not_coin82:
    cmp eax, 299
    jne not_coin83
    cmp ebx, 239
    jne not_coin83
    mov coin41, 1
    jmp end_if
not_coin83:
    cmp eax, 473
    jne not_coin84
    cmp ebx, 233
    jne not_coin84
    mov coin42, 1
    jmp end_if
not_coin84:
    cmp eax, 479
    jne not_coin85
    cmp ebx, 239
    jne not_coin85
    mov coin42, 1
    jmp end_if
not_coin85:
    cmp eax, 533
    jne not_coin86
    cmp ebx, 233
    jne not_coin86
    mov coin43, 1
    jmp end_if
not_coin86:
    cmp eax, 539
    jne not_coin87
    cmp ebx, 239
    jne not_coin87
    mov coin43, 1
    jmp end_if
not_coin87:
    cmp eax, 623
    jne not_coin88
    cmp ebx, 233
    jne not_coin88
    mov coin44, 1
    jmp end_if
not_coin88:
    cmp eax, 629
    jne not_coin89
    cmp ebx, 239
    jne not_coin89
    mov coin44, 1
    jmp end_if
not_coin89:
    cmp eax, 143
    jne not_coin90
    cmp ebx, 263
    jne not_coin90
    mov coin45, 1
    jmp end_if
not_coin90:
    cmp eax, 149
    jne not_coin91
    cmp ebx, 269
    jne not_coin91
    mov coin45, 1
    jmp end_if
not_coin91:
    cmp eax, 173
    jne not_coin92
    cmp ebx, 263
    jne not_coin92
    mov coin46, 1
    jmp end_if
not_coin92:
    cmp eax, 179
    jne not_coin93
    cmp ebx, 269
    jne not_coin93
    mov coin46, 1
    jmp end_if
not_coin93:
    cmp eax, 203
    jne not_coin94
    cmp ebx, 263
    jne not_coin94
    mov coin47, 1
    jmp end_if
not_coin94:
    cmp eax, 209
    jne not_coin95
    cmp ebx, 269
    jne not_coin95
    mov coin47, 1
    jmp end_if
not_coin95:
    cmp eax, 233
    jne not_coin96
    cmp ebx, 263
    jne not_coin96
    mov coin48, 1
    jmp end_if
not_coin96:
    cmp eax, 239
    jne not_coin97
    cmp ebx, 269
    jne not_coin97
    mov coin48, 1
    jmp end_if
not_coin97:
    cmp eax, 293
    jne not_coin98
    cmp ebx, 263
    jne not_coin98
    mov coin49, 1
    jmp end_if
not_coin98:
    cmp eax, 299
    jne not_coin99
    cmp ebx, 269
    jne not_coin99
    mov coin49, 1
    jmp end_if
not_coin99:
    cmp eax, 323
    jne not_coin100
    cmp ebx, 263
    jne not_coin100
    mov coin50, 1
    jmp end_if
not_coin100:
    cmp eax, 329
    jne not_coin101
    cmp ebx, 269
    jne not_coin101
    mov coin50, 1
    jmp end_if
not_coin101:
    cmp eax, 353
    jne not_coin102
    cmp ebx, 263
    jne not_coin102
    mov coin51, 1
    jmp end_if
not_coin102:
    cmp eax, 359
    jne not_coin103
    cmp ebx, 269
    jne not_coin103
    mov coin51, 1
    jmp end_if
not_coin103:
    cmp eax, 413
    jne not_coin104
    cmp ebx, 263
    jne not_coin104
    mov coin52, 1
    jmp end_if
not_coin104:
    cmp eax, 419
    jne not_coin105
    cmp ebx, 269
    jne not_coin105
    mov coin52, 1
    jmp end_if
not_coin105:
    cmp eax, 443
    jne not_coin106
    cmp ebx, 263
    jne not_coin106
    mov coin53, 1
    jmp end_if
not_coin106:
    cmp eax, 449
    jne not_coin107
    cmp ebx, 269
    jne not_coin107
    mov coin53, 1
    jmp end_if
not_coin107:
    cmp eax, 473
    jne not_coin108
    cmp ebx, 263
    jne not_coin108
    mov coin54, 1
    jmp end_if
not_coin108:
    cmp eax, 479
    jne not_coin109
    cmp ebx, 269
    jne not_coin109
    mov coin54, 1
    jmp end_if
not_coin109:
    cmp eax, 533
    jne not_coin110
    cmp ebx, 263
    jne not_coin110
    mov coin55, 1
    jmp end_if
not_coin110:
    cmp eax, 539
    jne not_coin111
    cmp ebx, 269
    jne not_coin111
    mov coin55, 1
    jmp end_if
not_coin111:
    cmp eax, 563
    jne not_coin112
    cmp ebx, 263
    jne not_coin112
    mov coin56, 1
    jmp end_if
not_coin112:
    cmp eax, 569
    jne not_coin113
    cmp ebx, 269
    jne not_coin113
    mov coin56, 1
    jmp end_if
not_coin113:
    cmp eax, 593
    jne not_coin114
    cmp ebx, 263
    jne not_coin114
    mov coin57, 1
    jmp end_if
not_coin114:
    cmp eax, 599
    jne not_coin115
    cmp ebx, 269
    jne not_coin115
    mov coin57, 1
    jmp end_if
not_coin115:
    cmp eax, 623
    jne not_coin116
    cmp ebx, 263
    jne not_coin116
    mov coin58, 1
    jmp end_if
not_coin116:
    cmp eax, 629
    jne not_coin117
    cmp ebx, 269
    jne not_coin117
    mov coin58, 1
    jmp end_if
not_coin117:
    cmp eax, 233
    jne not_coin118
    cmp ebx, 293
    jne not_coin118
    mov coin59, 1
    jmp end_if
not_coin118:
    cmp eax, 239
    jne not_coin119
    cmp ebx, 299
    jne not_coin119
    mov coin59, 1
    jmp end_if
not_coin119:
    cmp eax, 533
    jne not_coin120
    cmp ebx, 293
    jne not_coin120
    mov coin60, 1
    jmp end_if
not_coin120:
    cmp eax, 539
    jne not_coin121
    cmp ebx, 299
    jne not_coin121
    mov coin60, 1
    jmp end_if
not_coin121:
    cmp eax, 233
    jne not_coin122
    cmp ebx, 323
    jne not_coin122
    mov coin61, 1
    jmp end_if
not_coin122:
    cmp eax, 239
    jne not_coin123
    cmp ebx, 329
    jne not_coin123
    mov coin61, 1
    jmp end_if
not_coin123:
    cmp eax, 533
    jne not_coin124
    cmp ebx, 323
    jne not_coin124
    mov coin62, 1
    jmp end_if
not_coin124:
    cmp eax, 539
    jne not_coin125
    cmp ebx, 329
    jne not_coin125
    mov coin62, 1
    jmp end_if
not_coin125:
    cmp eax, 233
    jne not_coin126
    cmp ebx, 353
    jne not_coin126
    mov coin63, 1
    jmp end_if 
not_coin126:
    cmp eax, 239
    jne not_coin127
    cmp ebx, 359
    jne not_coin127
    mov coin63, 1
    jmp end_if
not_coin127:
    cmp eax, 533
    jne not_coin128
    cmp ebx, 353
    jne not_coin128
    mov coin64, 1
    jmp end_if
not_coin128:
    cmp eax, 539
    jne not_coin129
    cmp ebx, 359
    jne not_coin129
    mov coin64, 1
    jmp end_if
not_coin129:
    cmp eax, 233
    jne not_coin130
    cmp ebx, 383
    jne not_coin130
    mov coin65, 1
    jmp end_if
not_coin130:
    cmp eax, 239
    jne not_coin131
    cmp ebx, 389
    jne not_coin131
    mov coin65, 1
    jmp end_if
not_coin131:
    cmp eax, 533
    jne not_coin132
    cmp ebx, 383
    jne not_coin132
    mov coin66, 1
    jmp end_if
not_coin132:
    cmp eax, 539
    jne not_coin133
    cmp ebx, 389
    jne not_coin133
    mov coin66, 1
    jmp end_if
not_coin133:
    cmp eax, 233
    jne not_coin134
    cmp ebx, 413
    jne not_coin134
    mov coin67, 1
    jmp end_if
not_coin134:
    cmp eax, 239
    jne not_coin135
    cmp ebx, 419
    jne not_coin135
    mov coin67, 1
    jmp end_if
not_coin135:
    cmp eax, 533
    jne not_coin136
    cmp ebx, 413
    jne not_coin136
    mov coin68, 1
    jmp end_if
not_coin136:
    cmp eax, 539
    jne not_coin137
    cmp ebx, 419
    jne not_coin137
    mov coin68, 1
    jmp end_if
not_coin137:
    cmp eax, 143
    jne not_coin138
    cmp ebx, 443
    jne not_coin138
    mov coin69, 1
    jmp end_if
not_coin138:
    cmp eax, 149
    jne not_coin139
    cmp ebx, 449
    jne not_coin139
    mov coin69, 1
    jmp end_if
not_coin139:
    cmp eax, 173
    jne not_coin140
    cmp ebx, 443
    jne not_coin140
    mov coin70, 1
    jmp end_if
not_coin140:
    cmp eax, 179
    jne not_coin141
    cmp ebx, 449
    jne not_coin141
    mov coin70, 1
    jmp end_if
not_coin141:
    cmp eax, 203
    jne not_coin142
    cmp ebx, 443
    jne not_coin142
    mov coin71, 1
    jmp end_if
not_coin142:
    cmp eax, 209
    jne not_coin143
    cmp ebx, 449
    jne not_coin143
    mov coin71, 1
    jmp end_if
not_coin143:
    cmp eax, 233
    jne not_coin144
    cmp ebx, 443
    jne not_coin144
    mov coin72, 1
    jmp end_if
not_coin144:
    cmp eax, 239
    jne not_coin145
    cmp ebx, 449
    jne not_coin145
    mov coin72, 1
    jmp end_if
not_coin145:
    cmp eax, 263
    jne not_coin146
    cmp ebx, 443
    jne not_coin146
    mov coin73, 1
    jmp end_if
not_coin146:
    cmp eax, 269
    jne not_coin147
    cmp ebx, 449
    jne not_coin147
    mov coin73, 1
    jmp end_if
not_coin147:
    cmp eax, 293
    jne not_coin148
    cmp ebx, 443
    jne not_coin148
    mov coin74, 1
    jmp end_if
not_coin148:
    cmp eax, 299
    jne not_coin149
    cmp ebx, 449
    jne not_coin149
    mov coin74, 1
    jmp end_if
not_coin149:
    cmp eax, 323
    jne not_coin150
    cmp ebx, 443
    jne not_coin150
    mov coin75, 1
    jmp end_if
not_coin150:
    cmp eax, 329
    jne not_coin151
    cmp ebx, 449
    jne not_coin151
    mov coin75, 1
    jmp end_if
not_coin151:
    cmp eax, 353
    jne not_coin152
    cmp ebx, 443
    jne not_coin152
    mov coin76, 1
    jmp end_if
not_coin152:
    cmp eax, 359
    jne not_coin153
    cmp ebx, 449
    jne not_coin153
    mov coin76, 1
    jmp end_if
not_coin153:
    cmp eax, 413
    jne not_coin154
    cmp ebx, 443
    jne not_coin154
    mov coin77, 1
    jmp end_if
not_coin154:
    cmp eax, 419
    jne not_coin155
    cmp ebx, 449
    jne not_coin155
    mov coin77, 1
    jmp end_if
not_coin155:
    cmp eax, 443
    jne not_coin156
    cmp ebx, 443
    jne not_coin156
    mov coin78, 1
    jmp end_if
not_coin156:
    cmp eax, 449
    jne not_coin157
    cmp ebx, 449
    jne not_coin157
    mov coin78, 1
    jmp end_if
not_coin157:
    cmp eax, 473
    jne not_coin158
    cmp ebx, 443
    jne not_coin158
    mov coin79, 1
    jmp end_if
not_coin158:
    cmp eax, 479
    jne not_coin159
    cmp ebx, 449
    jne not_coin159
    mov coin79, 1
    jmp end_if
not_coin159:
    cmp eax, 503
    jne not_coin160
    cmp ebx, 443
    jne not_coin160
    mov coin80, 1
    jmp end_if
not_coin160:
    cmp eax, 509
    jne not_coin161
    cmp ebx, 449
    jne not_coin161
    mov coin80, 1
    jmp end_if
not_coin161:
    cmp eax, 533
    jne not_coin162
    cmp ebx, 443
    jne not_coin162
    mov coin81, 1
    jmp end_if
not_coin162:
    cmp eax, 539
    jne not_coin163
    cmp ebx, 449
    jne not_coin163
    mov coin81, 1
    jmp end_if
not_coin163:
    cmp eax, 563
    jne not_coin164
    cmp ebx, 443
    jne not_coin164
    mov coin82, 1
    jmp end_if
not_coin164:
    cmp eax, 569
    jne not_coin165
    cmp ebx, 449
    jne not_coin165
    mov coin82, 1
    jmp end_if
not_coin165:
    cmp eax, 593
    jne not_coin166
    cmp ebx, 443
    jne not_coin166
    mov coin83, 1
    jmp end_if
not_coin166:
    cmp eax, 599
    jne not_coin167
    cmp ebx, 449
    jne not_coin167
    mov coin83, 1
    jmp end_if
not_coin167:
    cmp eax, 623
    jne not_coin168
    cmp ebx, 443
    jne not_coin168
    mov coin84, 1
    jmp end_if
not_coin168:
    cmp eax, 629
    jne not_coin169
    cmp ebx, 449
    jne not_coin169
    mov coin84, 1
    jmp end_if
not_coin169:
    cmp eax, 233
    jne not_coin170
    cmp ebx, 473
    jne not_coin170
    mov coin85, 1
    jmp end_if
not_coin170:
    cmp eax, 239
    jne not_coin171
    cmp ebx, 479
    jne not_coin171
    mov coin85, 1
    jmp end_if
not_coin171:
    cmp eax, 353
    jne not_coin172
    cmp ebx, 473
    jne not_coin172
    mov coin86, 1
    jmp end_if
not_coin172:
    cmp eax, 359
    jne not_coin173
    cmp ebx, 479
    jne not_coin173
    mov coin86, 1
    jmp end_if
not_coin173:
    cmp eax, 413
    jne not_coin174
    cmp ebx, 473
    jne not_coin174
    mov coin87, 1
    jmp end_if
not_coin174:
    cmp eax, 419
    jne not_coin175
    cmp ebx, 479
    jne not_coin175
    mov coin87, 1
    jmp end_if
not_coin175:
    cmp eax, 533
    jne not_coin176
    cmp ebx, 473
    jne not_coin176
    mov coin88, 1
    jmp end_if
not_coin176:
    cmp eax, 539
    jne not_coin177
    cmp ebx, 479
    jne not_coin177
    mov coin88, 1
    jmp end_if
not_coin177:
    cmp eax, 143
    jne not_coin178
    cmp ebx, 503
    jne not_coin178
    mov coin89, 1
    jmp end_if
not_coin178:
    cmp eax, 149
    jne not_coin179
    cmp ebx, 509
    jne not_coin179
    mov coin89, 1
    jmp end_if
not_coin179:
    cmp eax, 173
    jne not_coin180
    cmp ebx, 503
    jne not_coin180
    mov coin90, 1
    jmp end_if
not_coin180:
    cmp eax, 179
    jne not_coin181
    cmp ebx, 509
    jne not_coin181
    mov coin90, 1
    jmp end_if
not_coin181:
    cmp eax, 233
    jne not_coin182
    cmp ebx, 503
    jne not_coin182
    mov coin91, 1
    jmp end_if
not_coin182:
    cmp eax, 239
    jne not_coin183
    cmp ebx, 509
    jne not_coin183
    mov coin91, 1
    jmp end_if
not_coin183:
    cmp eax, 263
    jne not_coin184
    cmp ebx, 503
    jne not_coin184
    mov coin92, 1
    jmp end_if
not_coin184:
    cmp eax, 269
    jne not_coin185
    cmp ebx, 509
    jne not_coin185
    mov coin92, 1
    jmp end_if
not_coin185:
    cmp eax, 293
    jne not_coin186
    cmp ebx, 503
    jne not_coin186
    mov coin93, 1
    jmp end_if
not_coin186:
    cmp eax, 299
    jne not_coin187
    cmp ebx, 509
    jne not_coin187
    mov coin93, 1
    jmp end_if
not_coin187:
    cmp eax, 323
    jne not_coin188
    cmp ebx, 503
    jne not_coin188
    mov coin94, 1
    jmp end_if
not_coin188:
    cmp eax, 329
    jne not_coin189
    cmp ebx, 509
    jne not_coin189
    mov coin94, 1
    jmp end_if
not_coin189:
    cmp eax, 353
    jne not_coin190
    cmp ebx, 503
    jne not_coin190
    mov coin95, 1
    jmp end_if
not_coin190:
    cmp eax, 359
    jne not_coin191
    cmp ebx, 509
    jne not_coin191
    mov coin95, 1
    jmp end_if
not_coin191:
    cmp eax, 413
    jne not_coin192
    cmp ebx, 503
    jne not_coin192
    mov coin96, 1
    jmp end_if
not_coin192:
    cmp eax, 419
    jne not_coin193
    cmp ebx, 509
    jne not_coin193
    mov coin96, 1
    jmp end_if
not_coin193:
    cmp eax, 443
    jne not_coin194
    cmp ebx, 503
    jne not_coin194
    mov coin97, 1
    jmp end_if
not_coin194:
    cmp eax, 449
    jne not_coin195
    cmp ebx, 509
    jne not_coin195
    mov coin97, 1
    jmp end_if
not_coin195:
    cmp eax, 473
    jne not_coin196
    cmp ebx, 503
    jne not_coin196
    mov coin98, 1
    jmp end_if
not_coin196:
    cmp eax, 479
    jne not_coin197
    cmp ebx, 509
    jne not_coin197
    mov coin98, 1
    jmp end_if
not_coin197:
    cmp eax, 503
    jne not_coin198
    cmp ebx, 503
    jne not_coin198
    mov coin99, 1
    jmp end_if
not_coin198:
    cmp eax, 509
    jne not_coin199
    cmp ebx, 509
    jne not_coin199
    mov coin99, 1
    jmp end_if
not_coin199:
    cmp eax, 533
    jne not_coin200
    cmp ebx, 503
    jne not_coin200
    mov coin100, 1
    jmp end_if
not_coin200:
    cmp eax, 539
    jne not_coin201
    cmp ebx, 509
    jne not_coin201
    mov coin100, 1
    jmp end_if
not_coin201:
    cmp eax, 593
    jne not_coin202
    cmp ebx, 503
    jne not_coin202
    mov coin101, 1
    jmp end_if
not_coin202:
    cmp eax, 599
    jne not_coin203
    cmp ebx, 509
    jne not_coin203
    mov coin101, 1
    jmp end_if
not_coin203:
    cmp eax, 623
    jne not_coin204
    cmp ebx, 503
    jne not_coin204
    mov coin102, 1
    jmp end_if
not_coin204:
    cmp eax, 629
    jne not_coin205
    cmp ebx, 509
    jne not_coin205
    mov coin102, 1
    jmp end_if
not_coin205:
    cmp eax, 173
    jne not_coin206
    cmp ebx, 533
    jne not_coin206
    mov coin103, 1
    jmp end_if
not_coin206:
    cmp eax, 179
    jne not_coin207
    cmp ebx, 539
    jne not_coin207
    mov coin103, 1
    jmp end_if
not_coin207:
    cmp eax, 233
    jne not_coin208
    cmp ebx, 533
    jne not_coin208
    mov coin104, 1
    jmp end_if
not_coin208:
    cmp eax, 239
    jne not_coin209
    cmp ebx, 539
    jne not_coin209
    mov coin104, 1
    jmp end_if
not_coin209:
    cmp eax, 293
    jne not_coin210
    cmp ebx, 533
    jne not_coin210
    mov coin105, 1
    jmp end_if
not_coin210:
    cmp eax, 299
    jne not_coin211
    cmp ebx, 539
    jne not_coin211
    mov coin105, 1
    jmp end_if
not_coin211:
    cmp eax, 473
    jne not_coin212
    cmp ebx, 533
    jne not_coin212
    mov coin106, 1
    jmp end_if
not_coin212:
    cmp eax, 479
    jne not_coin213
    cmp ebx, 539
    jne not_coin213
    mov coin106, 1
    jmp end_if
not_coin213:
    cmp eax, 533
    jne not_coin214
    cmp ebx, 533
    jne not_coin214
    mov coin107, 1
    jmp end_if
not_coin214:
    cmp eax, 539
    jne not_coin215
    cmp ebx, 539
    jne not_coin215
    mov coin107, 1
    jmp end_if
not_coin215:
    cmp eax, 593
    jne not_coin216
    cmp ebx, 533
    jne not_coin216
    mov coin108, 1
    jmp end_if
not_coin216:
    cmp eax, 599
    jne not_coin217
    cmp ebx, 539
    jne not_coin217
    mov coin108, 1
    jmp end_if
not_coin217:
    cmp eax, 143
    jne not_coin218
    cmp ebx, 563
    jne not_coin218
    mov coin109, 1
    jmp end_if
not_coin218:
    cmp eax, 149
    jne not_coin219
    cmp ebx, 569
    jne not_coin219
    mov coin109, 1
    jmp end_if
not_coin219:
    cmp eax, 173
    jne not_coin220
    cmp ebx, 563
    jne not_coin220
    mov coin110, 1
    jmp end_if
not_coin220:
    cmp eax, 179
    jne not_coin221
    cmp ebx, 569
    jne not_coin221
    mov coin110, 1
    jmp end_if
not_coin221:
    cmp eax, 203
    jne not_coin222
    cmp ebx, 563
    jne not_coin222
    mov coin111, 1
    jmp end_if
not_coin222:
    cmp eax, 209
    jne not_coin223
    cmp ebx, 569
    jne not_coin223
    mov coin111, 1
    jmp end_if
not_coin223:
    cmp eax, 233
    jne not_coin224
    cmp ebx, 563
    jne not_coin224
    mov coin112, 1
    jmp end_if
not_coin224:
    cmp eax, 239
    jne not_coin225
    cmp ebx, 569
    jne not_coin225
    mov coin112, 1
    jmp end_if
not_coin225:
    cmp eax, 293
    jne not_coin226
    cmp ebx, 563
    jne not_coin226
    mov coin113, 1
    jmp end_if
not_coin226:
    cmp eax, 299
    jne not_coin227
    cmp ebx, 569
    jne not_coin227
    mov coin113, 1
    jmp end_if
not_coin227:
    cmp eax, 323
    jne not_coin228
    cmp ebx, 563
    jne not_coin228
    mov coin114, 1
    jmp end_if
not_coin228:
    cmp eax, 329
    jne not_coin229
    cmp ebx, 569
    jne not_coin229
    mov coin114, 1
    jmp end_if
not_coin229:
    cmp eax, 353
    jne not_coin230
    cmp ebx, 563
    jne not_coin230
    mov coin115, 1
    jmp end_if
not_coin230:
    cmp eax, 359
    jne not_coin231
    cmp ebx, 569
    jne not_coin231
    mov coin115, 1
    jmp end_if
not_coin231:
    cmp eax, 413
    jne not_coin232
    cmp ebx, 563
    jne not_coin232
    mov coin116, 1
    jmp end_if
not_coin232:
    cmp eax, 419
    jne not_coin233
    cmp ebx, 569
    jne not_coin233
    mov coin116, 1
    jmp end_if
not_coin233:
    cmp eax, 443
    jne not_coin234
    cmp ebx, 563
    jne not_coin234
    mov coin117, 1
    jmp end_if
not_coin234:
    cmp eax, 449
    jne not_coin235
    cmp ebx, 569
    jne not_coin235
    mov coin117, 1
    jmp end_if
not_coin235:
    cmp eax, 473
    jne not_coin236
    cmp ebx, 563
    jne not_coin236
    mov coin118, 1
    jmp end_if
not_coin236:
    cmp eax, 479
    jne not_coin237
    cmp ebx, 569
    jne not_coin237
    mov coin118, 1
    jmp end_if
not_coin237:
    cmp eax, 533
    jne not_coin238
    cmp ebx, 563
    jne not_coin238
    mov coin119, 1
    jmp end_if
not_coin238:
    cmp eax, 539
    jne not_coin239
    cmp ebx, 569
    jne not_coin239
    mov coin119, 1
    jmp end_if
not_coin239:
    cmp eax, 563
    jne not_coin240
    cmp ebx, 563
    jne not_coin240
    mov coin120, 1
    jmp end_if
not_coin240:
    cmp eax, 569
    jne not_coin241
    cmp ebx, 569
    jne not_coin241
    mov coin120, 1
    jmp end_if
not_coin241:
    cmp eax, 593
    jne not_coin242
    cmp ebx, 563
    jne not_coin242
    mov coin121, 1
    jmp end_if
not_coin242:
    cmp eax, 599
    jne not_coin243
    cmp ebx, 569
    jne not_coin243
    mov coin121, 1
    jmp end_if
not_coin243:
    cmp eax, 623
    jne not_coin244
    cmp ebx, 563
    jne not_coin244
    mov coin122, 1
    jmp end_if
not_coin244:
    cmp eax, 629
    jne not_coin245
    cmp ebx, 569
    jne not_coin245
    mov coin122, 1
    jmp end_if
not_coin245:
    cmp eax, 143
    jne not_coin246
    cmp ebx, 593
    jne not_coin246
    mov coin123, 1
    jmp end_if
not_coin246:
    cmp eax, 149
    jne not_coin247
    cmp ebx, 599
    jne not_coin247
    mov coin123, 1
    jmp end_if
not_coin247:
    cmp eax, 353
    jne not_coin248
    cmp ebx, 593
    jne not_coin248
    mov coin124, 1
    jmp end_if
not_coin248:
    cmp eax, 359
    jne not_coin249
    cmp ebx, 599
    jne not_coin249
    mov coin124, 1
    jmp end_if
not_coin249:
    cmp eax, 413
    jne not_coin250
    cmp ebx, 593
    jne not_coin250
    mov coin125, 1
    jmp end_if
not_coin250:
    cmp eax, 419
    jne not_coin251
    cmp ebx, 599
    jne not_coin251
    mov coin125, 1
    jmp end_if
not_coin251:
    cmp eax, 623
    jne not_coin252
    cmp ebx, 593
    jne not_coin252
    mov coin126, 1
    jmp end_if
not_coin252:
    cmp eax, 629
    jne not_coin253
    cmp ebx, 599
    jne not_coin253
    mov coin126, 1
    jmp end_if
not_coin253:
    cmp eax, 143
    jne not_coin254
    cmp ebx, 623
    jne not_coin254
    mov coin127, 1
    jmp end_if
not_coin254:
    cmp eax, 149
    jne not_coin255
    cmp ebx, 629
    jne not_coin255
    mov coin127, 1
    jmp end_if
not_coin255:
    cmp eax, 173
    jne not_coin256
    cmp ebx, 623
    jne not_coin256
    mov coin128, 1
    jmp end_if
not_coin256:
    cmp eax, 179
    jne not_coin257
    cmp ebx, 629
    jne not_coin257
    mov coin128, 1
    jmp end_if
not_coin257:
    cmp eax, 203
    jne not_coin258
    cmp ebx, 623
    jne not_coin258
    mov coin129, 1
    jmp end_if
not_coin258:
    cmp eax, 209
    jne not_coin259
    cmp ebx, 629
    jne not_coin259
    mov coin129, 1
    jmp end_if
not_coin259:
    cmp eax, 233
    jne not_coin260
    cmp ebx, 623
    jne not_coin260
    mov coin130, 1
    jmp end_if
not_coin260:
    cmp eax, 239
    jne not_coin261
    cmp ebx, 629
    jne not_coin261
    mov coin130, 1
    jmp end_if
not_coin261:
    cmp eax, 263
    jne not_coin262
    cmp ebx, 623
    jne not_coin262
    mov coin131, 1
    jmp end_if
not_coin262:
    cmp eax, 269
    jne not_coin263
    cmp ebx, 629
    jne not_coin263
    mov coin131, 1
    jmp end_if
not_coin263:
    cmp eax, 293
    jne not_coin264
    cmp ebx, 623
    jne not_coin264
    mov coin132, 1
    jmp end_if
not_coin264:
    cmp eax, 299
    jne not_coin265
    cmp ebx, 629
    jne not_coin265
    mov coin132, 1
    jmp end_if
not_coin265:
    cmp eax, 323
    jne not_coin266
    cmp ebx, 623
    jne not_coin266
    mov coin133, 1
    jmp end_if
not_coin266:
    cmp eax, 329
    jne not_coin267
    cmp ebx, 629
    jne not_coin267
    mov coin133, 1
    jmp end_if
not_coin267:
    cmp eax, 353
    jne not_coin268
    cmp ebx, 623
    jne not_coin268
    mov coin134, 1
    jmp end_if
not_coin268:
    cmp eax, 359
    jne not_coin269
    cmp ebx, 629
    jne not_coin269
    mov coin134, 1
    jmp end_if
not_coin269:
    cmp eax, 383
    jne not_coin270
    cmp ebx, 623
    jne not_coin270
    mov coin135, 1
    jmp end_if
not_coin270:
    cmp eax, 389
    jne not_coin271
    cmp ebx, 629
    jne not_coin271
    mov coin135, 1
    jmp end_if
not_coin271:
    cmp eax, 413
    jne not_coin272
    cmp ebx, 623
    jne not_coin272
    mov coin136, 1
    jmp end_if
not_coin272:
    cmp eax, 419
    jne not_coin273
    cmp ebx, 629
    jne not_coin273
    mov coin136, 1
    jmp end_if
not_coin273:
    cmp eax, 443
    jne not_coin274
    cmp ebx, 623
    jne not_coin274
    mov coin137, 1
    jmp end_if
not_coin274:
    cmp eax, 449
    jne not_coin275
    cmp ebx, 629
    jne not_coin275
    mov coin137, 1
    jmp end_if
not_coin275:
    cmp eax, 473
    jne not_coin276
    cmp ebx, 623
    jne not_coin276
    mov coin138, 1
    jmp end_if
not_coin276:
    cmp eax, 479
    jne not_coin277
    cmp ebx, 629
    jne not_coin277
    mov coin138, 1
    jmp end_if
not_coin277:
    cmp eax, 503
    jne not_coin278
    cmp ebx, 623
    jne not_coin278
    mov coin139, 1
    jmp end_if
not_coin278:
    cmp eax, 509
    jne not_coin279
    cmp ebx, 629
    jne not_coin279
    mov coin139, 1
    jmp end_if
not_coin279:
    cmp eax, 533
    jne not_coin280
    cmp ebx, 623
    jne not_coin280
    mov coin140, 1
    jmp end_if
not_coin280:
    cmp eax, 539
    jne not_coin281
    cmp ebx, 629
    jne not_coin281
    mov coin140, 1
    jmp end_if
not_coin281:
    cmp eax, 563
    jne not_coin282
    cmp ebx, 623
    jne not_coin282
    mov coin141, 1
    jmp end_if
not_coin282:
    cmp eax, 569
    jne not_coin283
    cmp ebx, 629
    jne not_coin283
    mov coin141, 1
    jmp end_if
not_coin283:
    cmp eax, 593
    jne not_coin284
    cmp ebx, 623
    jne not_coin284
    mov coin142, 1
    jmp end_if
not_coin284:
    cmp eax, 599
    jne not_coin285
    cmp ebx, 629
    jne not_coin285
    mov coin142, 1
    jmp end_if
not_coin285:
    cmp eax, 623
    jne not_coin286
    cmp ebx, 623
    jne not_coin286
    mov coin143, 1
    jmp end_if
not_coin286:
    cmp eax, 629
    jne not_coin287
    cmp ebx, 629
    jne not_coin287
    mov coin143, 1
    jmp end_if
not_coin287:
    cmp eax, 140
    jne not_power0
    cmp ebx, 170
    jne not_power0
    mov power0, 1
    jmp end_if
not_power0:
    cmp eax, 150
    jne not_power1
    cmp ebx, 180
    jne not_power1
    mov power0, 1
    jmp end_if
not_power1:
    cmp eax, 620
    jne not_power2
    cmp ebx, 170
    jne not_power2
    mov power1, 1
    jmp end_if
not_power2:
    cmp eax, 630
    jne not_power3
    cmp ebx, 180
    jne not_power3
    mov power1, 1
    jmp end_if
not_power3:
    cmp eax, 140
    jne not_power4
    cmp ebx, 470
    jne not_power4
    mov power2, 1
    jmp end_if
not_power4:
    cmp eax, 150
    jne not_power5
    cmp ebx, 480
    jne not_power5
    mov power2, 1
    jmp end_if
not_power5:
    cmp eax, 620
    jne not_power6
    cmp ebx, 470
    jne not_power6
    mov power3, 1
    jmp end_if
not_power6:
    cmp eax, 630
    jne not_power7
    cmp ebx, 480
    jne not_power7
    mov power3, 1
    jmp end_if
not_power7:
end_if:
    dec ecx 
    cmp ecx, 0
    jne loop_col
    pop ecx 
    dec ecx
    cmp ecx, 0
    jne loop_row

    popa
    mov esp, ebp 
    pop ebp
    ret
coin_collision endp

coin_collision_macro macro x, y
    push y 
    push x 
    call coin_collision
    add esp, 8
endm

map proc 
    push ebp
    mov ebp, esp
    pusha

    coin_collision_macro pacman_x_coord, pacman_y_coord 

	square_macro area, 100, 100
    square_macro area, 130, 100
    square_macro area, 160, 100
    square_macro area, 190, 100
    square_macro area, 220, 100
    square_macro area, 250, 100
    square_macro area, 280, 100
    square_macro area, 310, 100
    square_macro area, 340, 100
    square_macro area, 370, 100
    square_macro area, 400, 100
    square_macro area, 430, 100
    square_macro area, 460, 100
    square_macro area, 490, 100
    square_macro area, 520, 100
    square_macro area, 550, 100
    square_macro area, 580, 100
    square_macro area, 610, 100
    square_macro area, 640, 100

    cmp power0, 1
    je no_power0
    power_macro area, 140, 170
no_power0:
    cmp power1, 1
    je no_power1
	power_macro area, 620, 170
no_power1:
    cmp power2, 1
    je no_power2
    power_macro area, 140, 470
no_power2:
    cmp power3, 1
    je no_power3
    power_macro area, 620, 470
no_power3:

    cmp coin0, 1
    je no_coin0
	coin_macro area, 143, 143
no_coin0:
    cmp coin1, 1
    je no_coin1
	coin_macro area, 173, 143
no_coin1:
    cmp coin2, 1
    je no_coin2
    coin_macro area, 203, 143
no_coin2:
    cmp coin3, 1    
    je no_coin3
    coin_macro area, 233, 143
no_coin3:
    cmp coin4, 1
    je no_coin4
    coin_macro area, 263, 143
no_coin4:
    cmp coin5, 1
    je no_coin5
    coin_macro area, 293, 143
no_coin5:
    cmp coin6, 1
    je no_coin6
    coin_macro area, 323, 143
no_coin6:
    cmp coin7, 1
    je no_coin7
    coin_macro area, 353, 143
no_coin7:
    cmp coin8, 1
    je no_coin8
    coin_macro area, 383, 143
no_coin8:
    cmp coin9, 1
    je no_coin9
    coin_macro area, 413, 143
no_coin9:
    cmp coin10, 1
    je no_coin10
    coin_macro area, 443, 143
no_coin10:
    cmp coin11, 1
    je no_coin11
    coin_macro area, 473, 143
no_coin11:
    cmp coin12, 1
    je no_coin12
    coin_macro area, 503, 143
no_coin12:
    cmp coin13, 1
    je no_coin13
    coin_macro area, 533, 143
no_coin13:
    cmp coin14, 1
    je no_coin14
    coin_macro area, 563, 143
no_coin14:
    cmp coin15, 1
    je no_coin15
    coin_macro area, 593, 143
no_coin15:
    cmp coin16, 1
    je no_coin16
    coin_macro area, 623, 143
no_coin16:
    cmp coin17, 1
    je no_coin17
    coin_macro area, 653, 143
no_coin17:
    cmp coin18, 1
    je no_coin18
    coin_macro area, 233, 173
no_coin18:
    cmp coin19, 1
    je no_coin19
    coin_macro area, 353, 173
no_coin19:
    cmp coin20, 1
    je no_coin20
    coin_macro area, 413, 173
no_coin20:
    cmp coin21, 1
    je no_coin21
    coin_macro area, 533, 173
no_coin21:
    cmp coin22, 1
    je no_coin22
    coin_macro area, 143, 203
no_coin22:
    cmp coin23, 1
    je no_coin23
    coin_macro area, 173, 203
no_coin23:
    cmp coin24, 1
    je no_coin24
    coin_macro area, 203, 203
no_coin24:
    cmp coin25, 1
    je no_coin25
    coin_macro area, 233, 203
no_coin25:
    cmp coin26, 1
    je no_coin26
    coin_macro area, 263, 203
no_coin26:
    cmp coin27, 1
    je no_coin27
    coin_macro area, 293, 203
no_coin27:
    cmp coin28, 1
    je no_coin28
    coin_macro area, 323, 203
no_coin28:
    cmp coin29, 1
    je no_coin29
    coin_macro area, 353, 203
no_coin29:
    cmp coin30, 1
    je no_coin30
    coin_macro area, 383, 203
no_coin30:
    cmp coin31, 1
    je no_coin31
    coin_macro area, 413, 203
no_coin31:
    cmp coin32, 1
    je no_coin32
    coin_macro area, 443, 203
no_coin32:
    cmp coin33, 1
    je no_coin33
    coin_macro area, 473, 203
no_coin33:
    cmp coin34, 1
    je no_coin34
    coin_macro area, 503, 203
no_coin34:
    cmp coin35, 1
    je no_coin35
    coin_macro area, 533, 203
no_coin35:
    cmp coin36, 1
    je no_coin36
    coin_macro area, 563, 203
no_coin36:
    cmp coin37, 1
    je no_coin37
    coin_macro area, 593, 203
no_coin37:
    cmp coin38, 1
    je no_coin38
    coin_macro area, 623, 203
no_coin38:
    cmp coin39, 1
    je no_coin39
    coin_macro area, 143, 233
no_coin39:
    cmp coin40, 1
    je no_coin40
    coin_macro area, 233, 233
no_coin40:
    cmp coin41, 1
    je no_coin41
    coin_macro area, 293, 233
no_coin41:
    cmp coin42, 1
    je no_coin42
    coin_macro area, 473, 233
no_coin42:
    cmp coin43, 1
    je no_coin43
    coin_macro area, 533, 233
no_coin43:
    cmp coin44, 1
    je no_coin44
    coin_macro area, 623, 233
no_coin44:
    cmp coin45, 1
    je no_coin45
    coin_macro area, 143, 263
no_coin45:
    cmp coin46, 1
    je no_coin46
    coin_macro area, 173, 263
no_coin46:
    cmp coin47, 1
    je no_coin47
    coin_macro area, 203, 263
no_coin47:
    cmp coin48, 1
    je no_coin48
    coin_macro area, 233, 263
no_coin48:
    cmp coin49, 1
    je no_coin49
    coin_macro area, 293, 263
no_coin49:
    cmp coin50, 1
    je no_coin50
    coin_macro area, 323, 263
no_coin50:
    cmp coin51, 1
    je no_coin51
    coin_macro area, 353, 263
no_coin51:
    cmp coin52, 1
    je no_coin52
    coin_macro area, 413, 263
no_coin52:
    cmp coin53, 1
    je no_coin53
    coin_macro area, 443, 263
no_coin53:
    cmp coin54, 1
    je no_coin54
    coin_macro area, 473, 263
no_coin54:
    cmp coin55, 1
    je no_coin55
    coin_macro area, 533, 263
no_coin55:
    cmp coin56, 1
    je no_coin56
    coin_macro area, 563, 263
no_coin56:
    cmp coin57, 1
    je no_coin57
    coin_macro area, 593, 263
no_coin57:
    cmp coin58, 1
    je no_coin58
    coin_macro area, 623, 263
no_coin58:
    cmp coin59, 1
    je no_coin59
    coin_macro area, 233, 293
no_coin59:
    cmp coin60, 1
    je no_coin60
    coin_macro area, 533, 293
no_coin60:
    cmp coin61, 1
    je no_coin61
    coin_macro area, 233, 323
no_coin61:
    cmp coin62, 1
    je no_coin62
    coin_macro area, 533, 323
no_coin62:
    cmp coin63, 1
    je no_coin63
    coin_macro area, 233, 353
no_coin63:
    cmp coin64, 1
    je no_coin64
    coin_macro area, 533, 353
no_coin64:
    cmp coin65, 1
    je no_coin65
    coin_macro area, 233, 383
no_coin65:
    cmp coin66, 1
    je no_coin66
    coin_macro area, 533, 383
no_coin66:
    cmp coin67, 1
    je no_coin67
    coin_macro area, 233, 413
no_coin67:
    cmp coin68, 1
    je no_coin68
    coin_macro area, 533, 413
no_coin68:
    cmp coin69, 1
    je no_coin69
    coin_macro area, 143, 443
no_coin69:
    cmp coin70, 1
    je no_coin70
    coin_macro area, 173, 443
no_coin70:
    cmp coin71, 1
    je no_coin71
    coin_macro area, 203, 443
no_coin71:
    cmp coin72, 1
    je no_coin72
    coin_macro area, 233, 443
no_coin72:
    cmp coin73, 1
    je no_coin73
    coin_macro area, 263, 443
no_coin73:
    cmp coin74, 1
    je no_coin74
    coin_macro area, 293, 443
no_coin74:
    cmp coin75, 1
    je no_coin75
    coin_macro area, 323, 443
no_coin75:
    cmp coin76, 1
    je no_coin76
    coin_macro area, 353, 443
no_coin76:
    cmp coin77, 1
    je no_coin77
    coin_macro area, 413, 443
no_coin77:
    cmp coin78, 1
    je no_coin78
    coin_macro area, 443, 443
no_coin78:
    cmp coin79, 1
    je no_coin79
    coin_macro area, 473, 443
no_coin79:
    cmp coin80, 1
    je no_coin80
    coin_macro area, 503, 443
no_coin80:
    cmp coin81, 1
    je no_coin81
    coin_macro area, 533, 443
no_coin81:
    cmp coin82, 1
    je no_coin82
    coin_macro area, 563, 443
no_coin82:
    cmp coin83, 1
    je no_coin83
    coin_macro area, 593, 443
no_coin83:
    cmp coin84, 1
    je no_coin84
    coin_macro area, 623, 443
no_coin84:
    cmp coin85, 1
    je no_coin85
    coin_macro area, 233, 473
no_coin85:
    cmp coin86, 1
    je no_coin86
    coin_macro area, 353, 473
no_coin86:
    cmp coin87, 1
    je no_coin87
    coin_macro area, 413, 473
no_coin87:
    cmp coin88, 1
    je no_coin88
    coin_macro area, 533, 473
no_coin88:
    cmp coin89, 1
    je no_coin89
    coin_macro area, 143, 503
no_coin89:
    cmp coin90, 1
    je no_coin90
    coin_macro area, 173, 503
no_coin90:
    cmp coin91, 1
    je no_coin91
    coin_macro area, 233, 503
no_coin91:
    cmp coin92, 1
    je no_coin92
    coin_macro area, 263, 503
no_coin92:
    cmp coin93, 1
    je no_coin93
    coin_macro area, 293, 503
no_coin93:
    cmp coin94, 1
    je no_coin94
    coin_macro area, 323, 503
no_coin94:
    cmp coin95, 1
    je no_coin95
    coin_macro area, 353, 503
no_coin95:
    cmp coin96, 1
    je no_coin96
    coin_macro area, 413, 503
no_coin96:
    cmp coin97, 1
    je no_coin97
    coin_macro area, 443, 503
no_coin97:
    cmp coin98, 1
    je no_coin98
    coin_macro area, 473, 503
no_coin98:
    cmp coin99, 1
    je no_coin99
    coin_macro area, 503, 503
no_coin99:
    cmp coin100, 1
    je no_coin100
    coin_macro area, 533, 503
no_coin100:
    cmp coin101, 1
    je no_coin101
    coin_macro area, 593, 503
no_coin101:
    cmp coin102, 1
    je no_coin102
    coin_macro area, 623, 503
no_coin102:
    cmp coin103, 1
    je no_coin103
    coin_macro area, 173, 533
no_coin103:
    cmp coin104, 1
    je no_coin104
    coin_macro area, 233, 533
no_coin104:
    cmp coin105, 1
    je no_coin105
    coin_macro area, 293, 533
no_coin105:
    cmp coin106, 1
    je no_coin106
    coin_macro area, 473, 533
no_coin106:
    cmp coin107, 1
    je no_coin107
    coin_macro area, 533, 533
no_coin107:
    cmp coin108, 1
    je no_coin108
    coin_macro area, 593, 533
no_coin108:
    cmp coin109, 1
    je no_coin109
    coin_macro area, 143, 563
no_coin109:
    cmp coin110, 1
    je no_coin110
    coin_macro area, 173, 563
no_coin110:
    cmp coin111, 1
    je no_coin111
    coin_macro area, 203, 563
no_coin111:
    cmp coin112, 1
    je no_coin112
    coin_macro area, 233, 563
no_coin112:
    cmp coin113, 1
    je no_coin113
    coin_macro area, 293, 563
no_coin113:
    cmp coin114, 1
    je no_coin114
    coin_macro area, 323, 563
no_coin114:
    cmp coin115, 1
    je no_coin115
    coin_macro area, 353, 563
no_coin115:
    cmp coin116, 1
    je no_coin116
    coin_macro area, 413, 563
no_coin116:
    cmp coin117, 1
    je no_coin117
    coin_macro area, 443, 563
no_coin117:
    cmp coin118, 1
    je no_coin118
    coin_macro area, 473, 563
no_coin118:
    cmp coin119, 1
    je no_coin119
    coin_macro area, 533, 563
no_coin119:
    cmp coin120, 1
    je no_coin120
    coin_macro area, 563, 563
no_coin120:
    cmp coin121, 1
    je no_coin121
    coin_macro area, 593, 563
no_coin121:
    cmp coin122, 1
    je no_coin122
    coin_macro area, 623, 563
no_coin122:
    cmp coin123, 1
    je no_coin123
    coin_macro area, 143, 593
no_coin123:
    cmp coin124, 1
    je no_coin124
    coin_macro area, 353, 593
no_coin124:
    cmp coin125, 1
    je no_coin125
    coin_macro area, 413, 593
no_coin125:
    cmp coin126, 1
    je no_coin126
    coin_macro area, 623, 593
no_coin126:
    cmp coin127, 1
    je no_coin127
    coin_macro area, 143, 623
no_coin127:
    cmp coin128, 1
    je no_coin128
    coin_macro area, 173, 623
no_coin128:
    cmp coin129, 1
    je no_coin129
    coin_macro area, 203, 623
no_coin129:
    cmp coin130, 1
    je no_coin130
    coin_macro area, 233, 623
no_coin130:
    cmp coin131, 1
    je no_coin131
    coin_macro area, 263, 623
no_coin131:
    cmp coin132, 1
    je no_coin132
    coin_macro area, 293, 623
no_coin132:
    cmp coin133, 1
    je no_coin133
    coin_macro area, 323, 623
no_coin133:
    cmp coin134, 1
    je no_coin134
    coin_macro area, 353, 623
no_coin134:
    cmp coin135, 1
    je no_coin135
    coin_macro area, 383, 623
no_coin135:
    cmp coin136, 1
    je no_coin136
    coin_macro area, 413, 623
no_coin136:
    cmp coin137, 1
    je no_coin137
    coin_macro area, 443, 623
no_coin137:
    cmp coin138, 1
    je no_coin138
    coin_macro area, 473, 623
no_coin138:
    cmp coin139, 1
    je no_coin139
    coin_macro area, 503, 623
no_coin139:
    cmp coin140, 1
    je no_coin140
    coin_macro area, 533, 623
no_coin140:
    cmp coin141, 1
    je no_coin141
    coin_macro area, 563, 623
no_coin141:
    cmp coin142, 1
    je no_coin142
    coin_macro area, 593, 623
no_coin142:
    cmp coin143, 1
    je no_coin143
    coin_macro area, 623, 623
no_coin143:
    square_macro area, 100, 130
    square_macro area, 100, 160
    square_macro area, 100, 190
    square_macro area, 100, 220
    square_macro area, 100, 250
    square_macro area, 100, 280
    square_macro area, 100, 310

    square_macro area, 100, 370
    square_macro area, 100, 400
    square_macro area, 100, 430
    square_macro area, 100, 460
    square_macro area, 100, 490
    square_macro area, 100, 520
    square_macro area, 100, 550
    square_macro area, 100, 580
    square_macro area, 100, 610
    square_macro area, 100, 640

    square_macro area, 640, 130
    square_macro area, 640, 160
    square_macro area, 640, 190
    square_macro area, 640, 220
    square_macro area, 640, 250
    square_macro area, 640, 280
    square_macro area, 640, 310
    square_macro area, 640, 370
    square_macro area, 640, 400
    square_macro area, 640, 430
    square_macro area, 640, 460
    square_macro area, 640, 490
    square_macro area, 640, 520
    square_macro area, 640, 550
    square_macro area, 640, 580
    square_macro area, 640, 610
    square_macro area, 640, 640

    square_macro area, 130, 640
    square_macro area, 160, 640
    square_macro area, 190, 640
    square_macro area, 220, 640
    square_macro area, 250, 640
    square_macro area, 280, 640
    square_macro area, 310, 640
    square_macro area, 340, 640
    square_macro area, 370, 640
    square_macro area, 400, 640
    square_macro area, 430, 640
    square_macro area, 460, 640
    square_macro area, 490, 640
    square_macro area, 520, 640
    square_macro area, 550, 640
    square_macro area, 580, 640
    square_macro area, 610, 640
    square_macro area, 640, 640

    square_macro area, 370, 130
    square_macro area, 370, 160

    square_macro area, 160, 580
    square_macro area, 190, 580
    square_macro area, 220, 580
    square_macro area, 250, 580
    square_macro area, 280, 580
    square_macro area, 310, 580
    square_macro area, 250, 550
    square_macro area, 250, 520

    square_macro area, 580, 580
    square_macro area, 550, 580
    square_macro area, 520, 580
    square_macro area, 490, 580
    square_macro area, 460, 580
    square_macro area, 430, 580
    square_macro area, 490, 550
    square_macro area, 490, 520

    square_macro area, 370, 580
    square_macro area, 370, 550
    square_macro area, 370, 520
    square_macro area, 340, 520
    square_macro area, 310, 520
    square_macro area, 400, 520
    square_macro area, 430, 520



    square_macro area, 130, 520
    square_macro area, 610, 520

    square_macro area, 190, 490
    square_macro area, 190, 460
    square_macro area, 190, 520
    square_macro area, 160, 460

    square_macro area, 550, 490
    square_macro area, 550, 460
    square_macro area, 550, 520
    square_macro area, 580, 460

    square_macro area, 250, 460
    square_macro area, 280, 460
    square_macro area, 310, 460

    square_macro area, 490, 460
    square_macro area, 460, 460
    square_macro area, 430, 460

    square_macro area, 370, 400
    square_macro area, 370, 430
    square_macro area, 370, 460
    square_macro area, 340, 400
    square_macro area, 310, 400
    square_macro area, 400, 400
    square_macro area, 430, 400

    square_macro area, 190, 400
    square_macro area, 160, 400
    square_macro area, 130, 400
    square_macro area, 190, 370
    square_macro area, 160, 370
    square_macro area, 130, 370

    square_macro area, 190, 310
    square_macro area, 160, 310
    square_macro area, 130, 310
    square_macro area, 190, 280
    square_macro area, 160, 280
    square_macro area, 130, 280

    square_macro area, 550, 400
    square_macro area, 580, 400
    square_macro area, 610, 400
    square_macro area, 550, 370
    square_macro area, 580, 370
    square_macro area, 610, 370

    square_macro area, 550, 310
    square_macro area, 580, 310
    square_macro area, 610, 310
    square_macro area, 550, 280
    square_macro area, 580, 280
    square_macro area, 610, 280

    square_macro area, 250, 400
    square_macro area, 250, 370

    square_macro area, 490, 400
    square_macro area, 490, 370

    square_macro area, 250, 310
    square_macro area, 250, 280
    square_macro area, 250, 250
    square_macro area, 250, 220
    square_macro area, 280, 280
    square_macro area, 310, 280


    square_macro area, 490, 310
    square_macro area, 490, 280
    square_macro area, 490, 250
    square_macro area, 490, 220
    square_macro area, 460, 280
    square_macro area, 430, 280

    square_macro area, 370, 280
    square_macro area, 370, 250
    square_macro area, 370, 220
    square_macro area, 340, 220
    square_macro area, 400, 220
    square_macro area, 430, 220
    square_macro area, 310, 220

    square_macro area, 160, 220
    square_macro area, 190, 220

    square_macro area, 550, 220
    square_macro area, 580, 220

    square_macro area, 160, 160
    square_macro area, 190, 160

    square_macro area, 550, 160
    square_macro area, 580, 160

    square_macro area, 250, 160
    square_macro area, 280, 160
    square_macro area, 310, 160

    square_macro area, 490, 160
    square_macro area, 460, 160
    square_macro area, 430, 160

    square_macro area, 370, 340
    square_macro area, 340, 340
    square_macro area, 400, 340
    square_macro area, 430, 340
    square_macro area, 310, 340
	
	; procedure to verify if pacman was on xOy coordinate of the coin 

    popa
    mov esp, ebp
    pop ebp
    ret
map endp 

map_macro macro area
    call map
endm

;procedure to display the ghost (blinky)
;arg1 - pointer to the area
;arg2 - x coordinate
;arg3 - y coordinate
display_blinky proc 
    push ebp
    mov ebp, esp
    pusha

    cmp blinky_ghost_mode, 1
    je ghost_mode
    lea esi, blinky
    jmp blinky_end
ghost_mode:
    lea esi, frightened
blinky_end:
    mov ecx, character_height
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col:
    mov edx, dword ptr [esi]
    mov dword ptr [edi], edx
    add esi, 4
    add edi, 4
    loop loop_col
    pop ecx
    loop loop_row

    popa 
	mov esp, ebp
    pop ebp
    ret
display_blinky endp

display_blinky_macro macro area, x, y
    push y
    push x
    push area
    call display_blinky
    add esp, 12
endm

;procedure to display the ghost (pinky)
;arg1 - pointer to the area
;arg2 - x coordinate
;arg3 - y coordinate
display_pinky proc 
    push ebp
    mov ebp, esp
    pusha

    cmp pinky_ghost_mode, 1
    je ghost_mode
    lea esi, pinky
    jmp pinky_end
ghost_mode:
    lea esi, frightened
pinky_end:
    mov ecx, character_height
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col:
    mov edx, dword ptr [esi]
    mov dword ptr [edi], edx
    add esi, 4
    add edi, 4
    loop loop_col
    pop ecx
    loop loop_row

    popa 
	mov esp, ebp
    pop ebp
    ret
display_pinky endp

display_pinky_macro macro area, x, y
    push y
    push x
    push area
    call display_pinky
    add esp, 12
endm

;procedure to display the ghost (inky)
;arg1 - pointer to the area
;arg2 - x coordinate
;arg3 - y coordinate
display_inky proc 
    push ebp
    mov ebp, esp
    pusha

    cmp inky_ghost_mode, 1
    je ghost_mode
    lea esi, inky
    jmp inky_end
ghost_mode:
    lea esi, frightened
inky_end:
    mov ecx, character_height
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col:
    mov edx, dword ptr [esi]
    mov dword ptr [edi], edx
    add esi, 4
    add edi, 4
    loop loop_col
    pop ecx
    loop loop_row

    popa 
	mov esp, ebp
    pop ebp
    ret
display_inky endp

display_inky_macro macro area, x, y
    push y
    push x
    push area
    call display_inky
    add esp, 12
endm

;procedure to display the ghost (clyde)
;arg1 - pointer to the area
;arg2 - x coordinate
;arg3 - y coordinate
display_clyde proc 
    push ebp
    mov ebp, esp
    pusha

    cmp clyde_ghost_mode, 1
    je ghost_mode
    lea esi, clyde
    jmp clyde_end
ghost_mode:
    lea esi, frightened
clyde_end:
    mov ecx, character_height
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col:
    mov edx, dword ptr [esi]
    mov dword ptr [edi], edx
    add esi, 4
    add edi, 4
    loop loop_col
    pop ecx
    loop loop_row

    popa 
	mov esp, ebp
    pop ebp
    ret
display_clyde endp

display_clyde_macro macro area, x, y
    push y
    push x
    push area
    call display_clyde
    add esp, 12
endm

; procedure to display the player
; arg1 - pointer to the area
; arg2 - x coordinate
; arg3 - y coordinate
pacman_player proc 
    push ebp
    mov ebp, esp
    pusha

    cmp show_pacman, 2
    jg skip
    lea esi, pacman
    jmp skip1
skip:
    cmp pacman_direction, 0
    jne not_up
    lea esi, pacman_up
    jmp skip1
not_up:
    cmp pacman_direction, 1
    jne not_right
    lea esi, pacman_right
    jmp skip1
not_right:
    cmp pacman_direction, 2
    jne not_down
    lea esi, pacman_down
    jmp skip1
not_down:
    cmp pacman_direction, 3
    jne not_left
    lea esi, pacman_left
    jmp skip1
not_left:

skip1:
    mov ecx, character_height
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width
    mul ebx 
    add eax, [ebp + arg2]
    shl eax, 2
    add edi, eax 
    push ecx 
    mov ecx, character_width
loop_col:
	mov edx, dword ptr [esi]
	mov dword ptr [edi], edx
    add esi, 4
    add edi, 4 
    loop loop_col
    pop ecx 
    loop loop_row

    popa 
    mov esp, ebp
    pop ebp
    ret     
pacman_player endp

pacman_player_macro macro area, x, y
    push y 
    push x 
    push area 
    call pacman_player
    add esp, 12
endm 

pacman_travel proc 
    push ebp
    mov ebp, esp
    pusha

    cmp pacman_x_coord, 97
    jne skip
    mov pacman_x_coord, 640
skip:

    cmp pacman_x_coord, 643
    jne skip1
    mov pacman_x_coord, 100
skip1:

    popa 
    mov esp, ebp
    pop ebp
    ret
pacman_travel endp

pacman_travel_macro macro
    call pacman_travel
endm

blinky_travel proc 
    push ebp
    mov ebp, esp
    pusha

    cmp blinky_x_coord, 97
    jne skip
    mov blinky_x_coord, 640
skip:

    cmp blinky_x_coord, 643
    jne skip1
    mov blinky_x_coord, 100
skip1:

    popa 
    mov esp, ebp
    pop ebp
    ret
blinky_travel endp

blinky_travel_macro macro
    call blinky_travel
endm

pinky_travel proc 
    push ebp
    mov ebp, esp
    pusha

    cmp pinky_x_coord, 97
    jne skip
    mov pinky_x_coord, 640
skip:

    cmp pinky_x_coord, 643
    jne skip1
    mov pinky_x_coord, 100
skip1:

    popa 
    mov esp, ebp
    pop ebp
    ret
pinky_travel endp

pinky_travel_macro macro
    call pinky_travel
endm

inky_travel proc 
    push ebp
    mov ebp, esp
    pusha

    cmp inky_x_coord, 97
    jne skip
    mov inky_x_coord, 640
skip:

    cmp inky_x_coord, 643
    jne skip1
    mov inky_x_coord, 100
skip1:

    popa 
    mov esp, ebp
    pop ebp
    ret
inky_travel endp

inky_travel_macro macro
    call inky_travel
endm

clyde_travel proc 
    push ebp
    mov ebp, esp
    pusha

    cmp clyde_x_coord, 97
    jne skip
    mov clyde_x_coord, 640
skip:

    cmp clyde_x_coord, 643
    jne skip1
    mov clyde_x_coord, 100
skip1:

    popa 
    mov esp, ebp
    pop ebp
    ret
clyde_travel endp

clyde_travel_macro macro
    call clyde_travel
endm

;procedure to display the lives
;arg1 - pointer to the area
;arg2 - x coordinate
;arg3 - y coordinate
display_lives proc 
    push ebp
    mov ebp, esp
    pusha

    lea esi, pacman_right
    mov ecx, character_height
loop_row:
    mov edi, [ebp + arg1] ; pointer to the area
    mov eax, [ebp + arg3] ; y coordinate
    add eax, character_height
    sub eax, ecx
    mov ebx, area_width 
    mul ebx
    add eax, [ebp + arg2] ; x coordinate
    shl eax, 2
    add edi, eax
    push ecx
    mov ecx, character_width
loop_col:
    mov edx, dword ptr [esi]
    mov dword ptr [edi], edx
    add esi, 4
    add edi, 4
    loop loop_col
    pop ecx
    loop loop_row

    popa 
	mov esp, ebp
    pop ebp
    ret
display_lives endp

display_lives_macro macro area, x, y
    push y
    push x
    push area
    call display_lives
    add esp, 12
endm

; procedure to display the lives of the players
; arg1 - number of lives
lives proc 
    push ebp
    mov ebp, esp
    pusha

    ;mov eax, [esp + arg1]

    cmp hp, 3
    je lives_3
    cmp hp, 2
    je lives_2
    cmp hp, 1
    je lives_1
    cmp hp, 0
    je lives_0

lives_3:
    display_lives_macro area, 750, 600
    display_lives_macro area, 780, 600
    display_lives_macro area, 810, 600
    jmp lives_end

lives_2:
	black_macro area, 750, 600
    display_lives_macro area, 780, 600
    display_lives_macro area, 810, 600
    jmp lives_end

lives_1:
	black_macro area, 750, 600
    display_lives_macro area, 780, 600
	black_macro area, 810, 600
    jmp lives_end

lives_0:

    mov eax, area_width
    mov ebx, area_height
    mul ebx 
    shl eax, 2 
    push eax 
    push 0 
    push area 
    call memset 
    add esp, 12 

    make_text_macro 'Y', area, 440, 350
    make_text_macro 'O', area, 450, 350
    make_text_macro 'U', area, 460, 350

    make_text_macro 'L', area, 480, 350
    make_text_macro 'O', area, 490, 350
    make_text_macro 'S', area, 500, 350
    make_text_macro 'T', area, 510, 350

    jmp lives_end

lives_end:
    popa 
    mov esp, ebp
    pop ebp
    ret
lives endp

lives_macro macro life
    ;push life
    call lives
    ;add esp, 4
endm

pacman_blinky_collision proc 
    push ebp 
    mov ebp, esp
    pusha 

    mov ecx, character_width
loop_row:
    mov eax, [ebp + arg1]
    add eax, character_width
    sub eax, ecx
    push ecx 
    mov ecx, character_height
loop_col:
    mov ebx, [ebp + arg2]
    add ebx, character_height
    sub ebx, ecx


    cmp eax, blinky_x_coord
    jne skip
    cmp ebx, blinky_y_coord
    jne skip
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    cmp blinky_ghost_mode, 0
    jne skip1
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip2
skip1:
    add score, 10
    mov blinky_ghost_mode, 0
skip2:
skip:

    mov edx, blinky_x_coord
    mov esi, blinky_y_coord
    add edx, 30
    add esi, 30

    cmp eax, edx
    jne skip3
    cmp ebx, esi
    jne skip3
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    cmp blinky_ghost_mode, 0
    jne skip4
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip5
skip4:
    add score, 10
    mov blinky_ghost_mode, 0
    
skip5:  
skip3: 

    mov edx, blinky_x_coord
    mov esi, blinky_y_coord
    add esi, 30

    cmp eax, edx
    jne skip6
    cmp ebx, esi
    jne skip6
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    cmp blinky_ghost_mode, 0
    jne skip7
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip8
skip7:
    add score, 10
    mov blinky_ghost_mode, 0
    
skip8:
skip6: 
    mov edx, blinky_x_coord
    mov esi, blinky_y_coord
    add edx, 30

    cmp eax, edx
    jne skip9
    cmp ebx, esi
    jne skip9
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    cmp blinky_ghost_mode, 0
    jne skip10
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip11
skip10:
    add score, 10
    mov blinky_ghost_mode, 0
skip11:
skip9: 







    dec ecx 
    cmp ecx, 0
    jne loop_col
    pop ecx 
    dec ecx
    cmp ecx, 0
    jne loop_row





    popa
    mov esp, ebp 
    pop ebp
    ret
pacman_blinky_collision endp

pacman_blinky_collision_macro macro x, y
    push y 
    push x 
    call pacman_blinky_collision
    add esp, 8
endm

pacman_pinky_collision proc 
    push ebp 
    mov ebp, esp
    pusha 

    mov ecx, character_width
loop_row:
    mov eax, [ebp + arg1]
    add eax, character_width
    sub eax, ecx
    push ecx 
    mov ecx, character_height
loop_col:
    mov ebx, [ebp + arg2]
    add ebx, character_height
    sub ebx, ecx


    cmp eax, pinky_x_coord
    jne skip
    cmp ebx, pinky_y_coord
    jne skip
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    cmp pinky_ghost_mode, 0
    jne skip1
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip2
skip1:
    add score, 10
    mov pinky_ghost_mode, 0
    
skip2:
skip:

    mov edx, pinky_x_coord
    mov esi, pinky_y_coord
    add edx, 30
    add esi, 30

    cmp eax, edx
    jne skip3
    cmp ebx, esi
    jne skip3
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    cmp pinky_ghost_mode, 0
    jne skip4
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip5
skip4:
    add score, 10
    mov pinky_ghost_mode, 0
    
skip5:
skip3: 

    mov edx, pinky_x_coord
    mov esi, pinky_y_coord
    add esi, 30

    cmp eax, edx
    jne skip6
    cmp ebx, esi
    jne skip6
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    cmp pinky_ghost_mode, 0
    jne skip7
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip8
skip7:
    add score, 10
    mov pinky_ghost_mode, 0
    
skip8:
skip6: 


    mov edx, pinky_x_coord
    mov esi, pinky_y_coord
    add edx, 30

    cmp eax, edx
    jne skip9
    cmp ebx, esi
    jne skip9
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    cmp pinky_ghost_mode, 0
    jne skip10
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip11
skip10:
    add score, 10
    mov pinky_ghost_mode, 0
    
skip11:
skip9: 
    dec ecx 
    cmp ecx, 0
    jne loop_col
    pop ecx 
    dec ecx
    cmp ecx, 0
    jne loop_row

    popa
    mov esp, ebp 
    pop ebp
    ret
pacman_pinky_collision endp

pacman_pinky_collision_macro macro x, y
    push y 
    push x 
    call pacman_pinky_collision
    add esp, 8
endm

pacman_inky_collision proc 
    push ebp 
    mov ebp, esp
    pusha 

    mov ecx, character_width
loop_row:
    mov eax, [ebp + arg1]
    add eax, character_width
    sub eax, ecx
    push ecx 
    mov ecx, character_height
loop_col:
    mov ebx, [ebp + arg2]
    add ebx, character_height
    sub ebx, ecx


    cmp eax, inky_x_coord
    jne skip
    cmp ebx, inky_y_coord
    jne skip
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    cmp inky_ghost_mode, 0
    jne skip1
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip2
skip1:
    add score, 10
    mov inky_ghost_mode, 0
    
skip2:
skip:

    mov edx, inky_x_coord
    mov esi, inky_y_coord
    add edx, 30
    add esi, 30

    cmp eax, edx
    jne skip3
    cmp ebx, esi
    jne skip3
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    cmp inky_ghost_mode, 0
    jne skip4
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip5
skip4:
    add score, 10
    mov inky_ghost_mode, 0
    
skip5:
skip3: 

    mov edx, inky_x_coord
    mov esi, inky_y_coord
    add esi, 30

    cmp eax, edx
    jne skip6
    cmp ebx, esi
    jne skip6
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    cmp inky_ghost_mode, 0
    jne skip7
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip8
skip7:
    add score, 10
    mov inky_ghost_mode, 0
    
skip8:
skip6: 


    mov edx, inky_x_coord
    mov esi, inky_y_coord
    add edx, 30

    cmp eax, edx
    jne skip9
    cmp ebx, esi
    jne skip9
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    cmp inky_ghost_mode, 0
    jne skip10
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    jmp skip11
skip10:
    add score, 10
    mov inky_ghost_mode, 0
    
skip11:
skip9: 
    dec ecx 
    cmp ecx, 0
    jne loop_col
    pop ecx 
    dec ecx
    cmp ecx, 0
    jne loop_row

    popa
    mov esp, ebp 
    pop ebp
    ret
pacman_inky_collision endp

pacman_inky_collision_macro macro x, y
    push y 
    push x 
    call pacman_inky_collision
    add esp, 8
endm

pacman_clyde_collision proc 
    push ebp 
    mov ebp, esp
    pusha 

    mov ecx, character_width
loop_row:
    mov eax, [ebp + arg1]
    add eax, character_width
    sub eax, ecx
    push ecx 
    mov ecx, character_height
loop_col:
    mov ebx, [ebp + arg2]
    add ebx, character_height
    sub ebx, ecx


    cmp eax, clyde_x_coord
    jne skip
    cmp ebx, clyde_y_coord
    jne skip
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    cmp clyde_ghost_mode, 0
    jne skip1
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    jmp skip2
skip1:
    add score, 10
    mov clyde_ghost_mode, 0
    
skip2:
skip:

    mov edx, clyde_x_coord
    mov esi, clyde_y_coord
    add edx, 30
    add esi, 30

    cmp eax, edx
    jne skip3
    cmp ebx, esi
    jne skip3
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    cmp clyde_ghost_mode, 0
    jne skip4
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    jmp skip5
skip4:
    add score, 10
    mov clyde_ghost_mode, 0
    
skip5:
skip3: 

    mov edx, clyde_x_coord
    mov esi, clyde_y_coord
    add esi, 30

    cmp eax, edx
    jne skip6
    cmp ebx, esi
    jne skip6
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    cmp clyde_ghost_mode, 0
    jne skip7
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    jmp skip8
skip7:
    add score, 10
    mov clyde_ghost_mode, 0
    
skip8:
skip6: 


    mov edx, clyde_x_coord
    mov esi, clyde_y_coord
    add edx, 30

    cmp eax, edx
    jne skip9
    cmp ebx, esi
    jne skip9
    black_macro area, pacman_x_coord, pacman_y_coord
    black_macro area, blinky_x_coord, blinky_y_coord
    black_macro area, pinky_x_coord, pinky_y_coord
    black_macro area, inky_x_coord, inky_y_coord
    black_macro area, clyde_x_coord, clyde_y_coord
    mov clyde_x_coord, 370
    mov clyde_y_coord, 310
    cmp clyde_ghost_mode, 0
    jne skip10
    sub hp, 1
    mov show_pinky, 0
    mov show_inky, 0
    mov show_clyde, 0
    mov pacman_x_coord, 370
    mov pacman_y_coord, 490
    mov blinky_x_coord, 370
    mov blinky_y_coord, 310
    mov pinky_x_coord, 370
    mov pinky_y_coord, 310
    mov inky_x_coord, 370
    mov inky_y_coord, 310
    jmp skip11
skip10:
    add score, 10
    mov clyde_ghost_mode, 0
    
skip11:
skip9: 
    dec ecx 
    cmp ecx, 0
    jne loop_col
    pop ecx 
    dec ecx
    cmp ecx, 0
    jne loop_row

    popa
    mov esp, ebp 
    pop ebp
    ret
pacman_clyde_collision endp

pacman_clyde_collision_macro macro x, y
    push y 
    push x 
    call pacman_clyde_collision
    add esp, 8
endm

win_message proc
    push ebp
    mov ebp, esp
    pusha

    cmp score, 140
    jle skip

    mov eax, area_width
    mov ebx, area_height
    mul ebx 
    shl eax, 2 
    push eax 
    push 0 
    push area 
    call memset 
    add esp, 12 

    make_text_macro 'Y', area, 440, 350
    make_text_macro 'O', area, 450, 350
    make_text_macro 'U', area, 460, 350

    make_text_macro 'W', area, 480, 350
    make_text_macro 'O', area, 490, 350
    make_text_macro 'N', area, 500, 350


skip:

    popa 
    mov esp, ebp 
    pop ebp 
    ret 
win_message endp

win_message_macro macro 
    call win_message
endm 

; functia de desenare 
; arg1 - evt (0 - initializare, 1 - click, 2 - s-a scurs intervalul fara click, 3 - s-a apasat o tasta)
; arg2 - x (in cazul apasarii unei taste, x contine codul ascii al tastei care a fost apasata)
; arg3 - y
draw proc 
    push ebp 
    mov ebp, esp
    pusha 

    mov eax, [ebp + arg1]
    cmp eax, 1 
    jz evt_click 
    cmp eax, 2 
    jz evt_timer 
    cmp eax, 3
    jz evt_key 

	mov eax, area_width
    mov ebx, area_height
    mul ebx 
    shl eax, 2 
    push eax 
    push 0 
    push area 
    call memset 
    add esp, 12 
	
    jmp afisare_litere 
	
evt_click:
jmp afisare_litere
evt_timer:
    collision_D_pressed_macro area, pacman_x_coord, pacman_y_coord
    collision_W_pressed_macro area, pacman_x_coord, pacman_y_coord
    collision_A_pressed_macro area, pacman_x_coord, pacman_y_coord
    collision_S_pressed_macro area, pacman_x_coord, pacman_y_coord
	
    add power_timer, 1
    add show_pinky, 1
    add show_inky, 1
    add show_clyde, 1
    add show_pacman, 1
	add blinky_timer, 1
    
    cmp show_pacman, 4
    jle skip4
    mov show_pacman, 0
skip4:

    map_macro
    pacman_player_macro area, pacman_x_coord, pacman_y_coord	

	display_blinky_macro area, blinky_x_coord, blinky_y_coord
	pacman_blinky_collision_macro pacman_x_coord, pacman_y_coord

	cmp blinky_timer, 125
    jge change_blinky_mode
    blinky_movement_macro
    jmp skip9

change_blinky_mode:
    blinky_chase_mode_macro
    cmp blinky_timer, 250
    jle reset_timer
    mov blinky_timer, 0
reset_timer:
skip9:

    cmp show_pinky, 100
    jle skip1

    add pinky_timer, 1
    display_pinky_macro area, pinky_x_coord, pinky_y_coord
    pacman_pinky_collision_macro pacman_x_coord, pacman_y_coord
    
    cmp pinky_timer, 125
    jge change_pinky_mode
    pinky_movement_macro
    jmp next_timer

change_pinky_mode:
    pinky_chase_mode_macro
    cmp pinky_timer, 250
    jle reset_timer1
    mov pinky_timer, 0
reset_timer1:
skip1:
next_timer:

    cmp show_inky, 200
    jle skip2

    add inky_timer, 1
    display_inky_macro area, inky_x_coord, inky_y_coord
    pacman_inky_collision_macro pacman_x_coord, pacman_y_coord

    cmp inky_timer, 125
    jge change_inky_mode
    inky_movement_macro
    jmp next_timer1

change_inky_mode:
    inky_chase_mode_macro
    cmp inky_timer, 250
    jle reset_timer2    
    mov inky_timer, 0
reset_timer2:
skip2:
next_timer1:

    cmp show_clyde, 300
    jle skip3

    add clyde_timer, 1
    display_clyde_macro area, clyde_x_coord, clyde_y_coord
    pacman_clyde_collision_macro pacman_x_coord, pacman_y_coord

    cmp clyde_timer, 125
    jge change_clyde_mode
    clyde_movement_macro
    jmp next_timer2

change_clyde_mode:
    clyde_chase_mode_macro
    cmp clyde_timer, 250
    jle reset_timer3
    mov clyde_timer, 0
reset_timer3:
skip3:
next_timer2:
    cmp power_timer, 50
    jle skip 
    mov blinky_ghost_mode, 0
    mov pinky_ghost_mode, 0
    mov inky_ghost_mode, 0
    mov clyde_ghost_mode, 0
skip:
jmp afisare_litere
evt_key:
    mov eax, [ebp + arg2]
    cmp eax, 68
	jz D_pressed
	cmp eax, 87
	jz W_pressed
	cmp eax, 65
	jz A_pressed
	cmp eax, 83
	jz S_pressed
	jmp afisare_litere
	
D_pressed:
    mov pacman_next_direction, 1
	jmp afisare_litere
W_pressed:
    mov pacman_next_direction, 0
	jmp afisare_litere
A_pressed:
    mov pacman_next_direction, 3
	jmp afisare_litere
S_pressed:
    mov pacman_next_direction, 2
	jmp afisare_litere
	

afisare_litere:
afisare_pacman:	
        
    blinky_travel_macro
    pacman_travel_macro
    pinky_travel_macro
    inky_travel_macro
    clyde_travel_macro
    black_macro area, 100, 340
    black_macro area, 640, 340

    make_text_macro 'H', area, 750, 50
	make_text_macro 'I', area, 760, 50
	make_text_macro 'G', area, 770, 50
	make_text_macro 'H', area, 780, 50

	make_text_macro 'S', area, 800, 50
	make_text_macro 'C', area, 810, 50
	make_text_macro 'O', area, 820, 50
	make_text_macro 'R', area, 830, 50
	make_text_macro 'E', area, 840, 50

    ;afisam valoarea score-ului curent (sute, zeci si unitati)
	mov ebx, 10
	mov eax, score
	;cifra unitatilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 800, 70
	;cifra zecilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 790, 70
	;cifra sutelor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 780, 70
    
    lives_macro
    win_message_macro

    popa
    mov esp, ebp
    pop ebp
    ret
draw endp

start:

    mov eax, area_width
    mov ebx, area_height
    mul ebx
    shl eax, 2
    push eax
    call malloc
    add esp, 4
    mov area, eax

    push offset draw 
    push area 
    push area_height
    push area_width
    push offset window_title 
    call BeginDrawing
    add esp, 20
    
    push 0 
    call exit
end start 
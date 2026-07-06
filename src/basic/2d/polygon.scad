points = [
    // Contorno externo
    [0,0],     //0
    [60,0],    //1
    [60,60],   //2
    [0,60],    //3

    // Contorno interno
    [15,15],   //4
    [45,15],   //5
    [45,45],   //6
    [15,45]    //7
];
linear_extrude(height=1)
    polygon(
        points=points,
        paths = [
        [0,1,2,3],    // contorno externo
        [7,6,5,4]     // contorno interno (invertido)
    ]
);
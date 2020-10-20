// 랜덤한 색상을 리턴하는 함수 getRandomColor
function getRandomColor() {
    const r = Math.floor(Math.random()*256);
    const g = Math.floor(Math.random()*256);
    const b = 200;
    const color = `rgb(${r}, ${g}, ${b})`
    return color;
} // getRandomColor() end
function openTrailer() {
    const trailer = document.querySelectorAll('.trailer-container')[0]
    trailer.style.display = 'flex'
    trailer.style.opacity = 1
    
}

function closeTrailer() {
    const trailer = document.querySelectorAll('.trailer-container')[0]
    trailer.style.opacity = 0
    trailer.style.display = 'none'
    // callPlayer("stopVideo")
}
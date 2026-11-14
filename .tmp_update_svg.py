from pathlib import Path
root = Path('D:/Work/DrawApp/assets/illustrations')
files = {
'cat.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M146 286c0-66 52-118 118-118s118 52 118 118v54c0 45-36 82-82 82H228c-45 0-82-37-82-82v-54Z"/>
    <path d="M166 200 126 136l52 28"/>
    <path d="M346 200 386 136l-52 28"/>
    <path d="M228 240h56v30h-56z"/>
    <path d="M198 310c12 16 28 24 58 24s46-8 58-24"/>
    <path d="M214 188v-26"/>
    <path d="M298 188v-26"/>
    <path d="M178 352 134 410"/>
    <path d="M334 352 378 410"/>
    <path d="M196 250h-30"/>
    <path d="M316 250h30"/>
    <path d="M158 234 98 220"/>
    <path d="M354 234 414 220"/>
    <circle cx="216" cy="286" r="6" fill="#111827" stroke="none"/>
    <circle cx="296" cy="286" r="6" fill="#111827" stroke="none"/>
    <path d="M210 330c18 18 28 28 46 28 18 0 28-10 46-28"/>
  </g>
</svg>
''',
'dog.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M132 282c0-64 54-116 120-116s120 52 120 116v54c0 52-42 94-94 94H226c-52 0-94-42-94-94v-54Z"/>
    <path d="M178 214 124 152l54 28"/>
    <path d="M334 214 388 152l-54 28"/>
    <path d="M222 236h68v28h-68z"/>
    <path d="M246 314 224 366"/>
    <path d="M266 314 288 366"/>
    <path d="M176 338 128 403"/>
    <path d="M336 338 384 403"/>
    <path d="M192 250h-26"/>
    <path d="M320 250h26"/>
    <path d="M150 232 92 218"/>
    <path d="M362 232 420 218"/>
    <path d="M150 332c18 18 36 28 58 28 22 0 40-10 58-28"/>
    <circle cx="222" cy="286" r="6" fill="#111827" stroke="none"/>
    <circle cx="290" cy="286" r="6" fill="#111827" stroke="none"/>
    <path d="M240 158c-8-28-28-46-54-52"/>
    <path d="M272 158c8-28 28-46 54-52"/>
  </g>
</svg>
''',
'fox.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M146 280c0-72 58-130 130-130s130 58 130 130v52c0 62-50 112-112 112H258c-62 0-112-50-112-112v-52Z"/>
    <path d="M196 220 148 118l54 56"/>
    <path d="M316 220 364 118l-54 56"/>
    <path d="M208 298h96"/>
    <path d="M178 360 120 416"/>
    <path d="M334 360 392 416"/>
    <path d="M236 216 196 188"/>
    <path d="M276 216 316 188"/>
    <path d="M164 254 128 238"/>
    <path d="M348 254 384 238"/>
    <path d="M210 326c16 18 38 28 46 28 8 0 30-10 46-28"/>
    <path d="M256 304v62"/>
    <circle cx="220" cy="280" r="6" fill="#111827" stroke="none"/>
    <circle cx="292" cy="280" r="6" fill="#111827" stroke="none"/>
  </g>
</svg>
''',
'bunny.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M164 300c0-72 58-130 130-130s130 58 130 130v52c0 62-50 112-112 112H276c-62 0-112-50-112-112v-52Z"/>
    <path d="M178 156 144 86l52 34"/>
    <path d="M334 156 368 86l-52 34"/>
    <path d="M190 244 150 196"/>
    <path d="M322 244 362 196"/>
    <path d="M228 304h56v38h-56z"/>
    <path d="M196 350 148 410"/>
    <path d="M316 350 364 410"/>
    <path d="M210 330c20 18 36 28 46 28 10 0 26-10 46-28"/>
    <circle cx="220" cy="282" r="6" fill="#111827" stroke="none"/>
    <circle cx="292" cy="282" r="6" fill="#111827" stroke="none"/>
    <path d="M248 160v-38"/>
    <path d="M264 160v-38"/>
  </g>
</svg>
''',
'fish.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M116 254c38-56 98-90 166-90 84 0 154 64 154 116s-70 116-154 116c-68 0-128-34-166-90l-42 10 42-46-42-46Z"/>
    <path d="M256 168 312 104l32 30"/>
    <path d="M256 342 312 408l32-30"/>
    <path d="M244 216v80"/>
    <path d="M190 254h96"/>
    <circle cx="210" cy="254" r="6" fill="#111827" stroke="none"/>
    <circle cx="284" cy="254" r="6" fill="#111827" stroke="none"/>
  </g>
</svg>
''',
'penguin.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M158 278c0-76 62-138 138-138s138 62 138 138v52c0 78-62 140-138 140s-138-62-138-140v-52Z"/>
    <path d="M214 172c18-28 38-42 42-42 4 0 24 14 42 42"/>
    <path d="M205 230h102v42H205z"/>
    <path d="M226 294h60"/>
    <path d="M206 350 174 398"/>
    <path d="M306 350 338 398"/>
    <circle cx="220" cy="260" r="6" fill="#111827" stroke="none"/>
    <circle cx="292" cy="260" r="6" fill="#111827" stroke="none"/>
    <path d="M214 324c22 18 36 26 42 26 6 0 20-8 42-26"/>
    <path d="M156 288 102 276"/>
    <path d="M356 288 410 276"/>
  </g>
</svg>
''',
'elephant.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M128 294c0-68 54-122 122-122 44 0 82 16 110 44 18 19 30 46 30 76v44c0 58-48 106-106 106H234c-58 0-106-48-106-106v-42Z"/>
    <path d="M190 210 124 142l54 38"/>
    <path d="M322 210 388 142l-54 38"/>
    <path d="M212 266h88"/>
    <path d="M210 326c16 16 30 24 46 24s30-8 46-24"/>
    <path d="M248 220v82"/>
    <path d="M264 220v82"/>
    <path d="M176 334 128 408"/>
    <path d="M336 334 384 408"/>
    <circle cx="220" cy="284" r="6" fill="#111827" stroke="none"/>
    <circle cx="292" cy="284" r="6" fill="#111827" stroke="none"/>
    <path d="M346 262 414 236"/>
  </g>
</svg>
''',
'butterfly.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M160 256c0-56 44-100 100-100 30 0 58 12 80 34 22 22 34 50 34 82 0 56-44 100-100 100-30 0-58-12-80-34-22-22-34-50-34-82Z"/>
    <path d="M178 176c-48-42-72-96-72-126 44 0 82 18 108 52"/>
    <path d="M334 176c48-42 72-96 72-126-44 0-82 18-108 52"/>
    <path d="M186 336c-48 42-72 96-72 126 44 0 82-18 108-52"/>
    <path d="M326 336c48 42 72 96 72 126-44 0-82-18-108-52"/>
    <path d="M256 152v208"/>
    <path d="M160 256h192"/>
    <path d="M196 196c-20 20-32 44-36 60"/>
    <path d="M316 196c20 20 32 44 36 60"/>
  </g>
</svg>
''',
'car.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M94 302 160 220h192l78 58v56c0 28-22 50-50 50H144c-28 0-50-22-50-50v-56Z"/>
    <path d="M154 220 204 172h104l50 48"/>
    <path d="M176 220v-46h160v46"/>
    <path d="M170 296h172"/>
    <path d="M182 242h150"/>
    <circle cx="170" cy="366" r="42"/>
    <circle cx="340" cy="366" r="42"/>
    <circle cx="170" cy="366" r="16" fill="#111827" stroke="none"/>
    <circle cx="340" cy="366" r="16" fill="#111827" stroke="none"/>
    <path d="M214 220v-36"/>
    <path d="M298 220v-36"/>
  </g>
</svg>
''',
'truck.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M90 305 128 246h210l84 58v58c0 24-20 44-44 44H134c-24 0-44-20-44-44v-58Z"/>
    <path d="M136 246 192 194h142l64 52"/>
    <path d="M182 252h160v56H182z"/>
    <circle cx="164" cy="370" r="42"/>
    <circle cx="340" cy="370" r="42"/>
    <circle cx="164" cy="370" r="16" fill="#111827" stroke="none"/>
    <circle cx="340" cy="370" r="16" fill="#111827" stroke="none"/>
    <path d="M324 246v-48h52v48"/>
    <path d="M146 304h-42"/>
    <path d="M380 304h42"/>
  </g>
</svg>
''',
'van.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M92 306 130 238h228l82 52v58c0 24-20 44-44 44H136c-24 0-44-20-44-44v-58Z"/>
    <path d="M146 238 196 184h120l56 54"/>
    <path d="M174 238v-42h168v42"/>
    <path d="M176 286h160"/>
    <circle cx="170" cy="372" r="42"/>
    <circle cx="340" cy="372" r="42"/>
    <circle cx="170" cy="372" r="16" fill="#111827" stroke="none"/>
    <circle cx="340" cy="372" r="16" fill="#111827" stroke="none"/>
    <path d="M198 238v-34"/>
    <path d="M314 238v-34"/>
  </g>
</svg>
''',
'tractor.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M112 304 160 246h150l86 58v54c0 28-22 50-50 50H156c-28 0-50-22-50-50v-54Z"/>
    <path d="M180 246 228 196h92l60 50"/>
    <path d="M210 246v-52h84v52"/>
    <circle cx="170" cy="370" r="42"/>
    <circle cx="332" cy="370" r="42"/>
    <circle cx="170" cy="370" r="16" fill="#111827" stroke="none"/>
    <circle cx="332" cy="370" r="16" fill="#111827" stroke="none"/>
    <path d="M308 246v-58h52v58"/>
    <path d="M182 296h126"/>
  </g>
</svg>
''',
'firetruck.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M96 292 152 220h196l76 54v58c0 28-22 50-50 50H146c-28 0-50-22-50-50v-58Z"/>
    <path d="M160 220 212 170h104l54 50"/>
    <path d="M180 220v-40h148v40"/>
    <path d="M192 294h122"/>
    <circle cx="170" cy="366" r="42"/>
    <circle cx="340" cy="366" r="42"/>
    <circle cx="170" cy="366" r="16" fill="#111827" stroke="none"/>
    <circle cx="340" cy="366" r="16" fill="#111827" stroke="none"/>
    <path d="M212 170v-36h54v36"/>
    <path d="M258 170v-36h54v36"/>
  </g>
</svg>
''',
'police.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M94 298 138 232h232l84 52v58c0 28-22 50-50 50H144c-28 0-50-22-50-50v-58Z"/>
    <path d="M148 232 206 180h100l58 52"/>
    <path d="M176 232v-42h160v42"/>
    <path d="M186 296h138"/>
    <circle cx="170" cy="370" r="42"/>
    <circle cx="340" cy="370" r="42"/>
    <circle cx="170" cy="370" r="16" fill="#111827" stroke="none"/>
    <circle cx="340" cy="370" r="16" fill="#111827" stroke="none"/>
    <path d="M256 180 228 130h56l-28 50Z"/>
    <path d="M206 298 256 238l50 60"/>
  </g>
</svg>
''',
'house.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M110 238 256 120l146 118v122c0 34-26 60-60 60H170c-34 0-60-26-60-60V238Z"/>
    <path d="M170 238v-50h172v50"/>
    <path d="M206 292h100v116H206z"/>
    <path d="M172 338h168"/>
    <path d="M294 338v-46"/>
    <path d="M196 260h38"/>
    <path d="M278 260h38"/>
    <path d="M226 202 256 176l30 26"/>
  </g>
</svg>
''',
'small_house.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M124 246 256 138l132 108v112c0 32-26 58-58 58H182c-32 0-58-26-58-58V246Z"/>
    <path d="M184 248v-44h144v44"/>
    <path d="M202 290h108v90H202z"/>
    <path d="M220 310h72"/>
    <path d="M172 356h168"/>
    <path d="M224 160 256 132l32 28"/>
  </g>
</svg>
''',
'villa.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M98 242 256 118l158 124v128c0 34-28 62-62 62H160c-34 0-62-28-62-62V242Z"/>
    <path d="M168 238V182h176v56"/>
    <path d="M182 286h148v108H182z"/>
    <path d="M214 286v-46h84v46"/>
    <path d="M214 344h84"/>
    <path d="M152 400h208"/>
    <path d="M194 172 256 132l62 40"/>
  </g>
</svg>
''',
'playground.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M120 348h272"/>
    <path d="M180 148v200"/>
    <path d="M332 148v200"/>
    <path d="M120 214h272"/>
    <path d="M214 166 256 126l42 40"/>
    <path d="M214 348v-82"/>
    <path d="M298 348v-82"/>
    <path d="M196 292h120"/>
    <path d="M256 126V92"/>
    <path d="M164 386 116 430"/>
    <path d="M348 386 396 430"/>
  </g>
</svg>
''',
'boat.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M112 292h286l-42 74H154l-42-74Z"/>
    <path d="M154 292 200 202h112l46 90"/>
    <path d="M224 202V126h64v76"/>
    <path d="M170 292v-42h172v42"/>
    <path d="M120 238 82 206"/>
    <path d="M390 238 428 206"/>
    <path d="M190 334h132"/>
    <path d="M256 126V94"/>
  </g>
</svg>
''',
'sun_house.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="386" cy="122" r="28"/>
    <path d="M104 238 256 120l152 118v124c0 34-28 62-62 62H166c-34 0-62-28-62-62V238Z"/>
    <path d="M166 238v-46h180v46"/>
    <path d="M190 290h132v98H190z"/>
    <path d="M206 302h100"/>
    <path d="M214 342h84"/>
    <path d="M150 400h212"/>
    <path d="M196 172 256 132l60 40"/>
  </g>
</svg>
''',
'animal.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M148 280c0-66 54-120 120-120s120 54 120 120v52c0 60-48 108-108 108H256c-60 0-108-48-108-108v-52Z"/>
    <path d="M168 218 110 170l56 18"/>
    <path d="M344 218 402 170l-56 18"/>
    <path d="M212 252h88"/>
    <path d="M226 332c12 14 24 22 30 22s18-8 30-22"/>
    <circle cx="220" cy="286" r="6" fill="#111827" stroke="none"/>
    <circle cx="292" cy="286" r="6" fill="#111827" stroke="none"/>
  </g>
</svg>
''',
'vehicle.svg': '''<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#111827" stroke-width="8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M98 290 156 220h200l58 70v54c0 28-22 50-50 50H148c-28 0-50-22-50-50v-54Z"/>
    <path d="M158 220 204 170h104l46 50"/>
    <path d="M194 220v-34h124v34"/>
    <path d="M188 292h136"/>
    <circle cx="170" cy="366" r="42"/>
    <circle cx="340" cy="366" r="42"/>
    <circle cx="170" cy="366" r="16" fill="#111827" stroke="none"/>
    <circle cx="340" cy="366" r="16" fill="#111827" stroke="none"/>
  </g>
</svg>
'''
}
for name, content in files.items():
    (root / name).write_text(content, encoding='utf-8')
print(f'updated {len(files)} SVG files')

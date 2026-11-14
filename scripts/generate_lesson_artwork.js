const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..', 'assets', 'lessons');
const ink = '#49372F';
const paper = '#FFF8EF';
const p = (d, fill = 'none', stroke = ink) =>
  `<path d="${d}" fill="${fill}" stroke="${stroke}" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>`;
const line = (d, stroke = ink, width = 5) =>
  `<path d="${d}" fill="none" stroke="${stroke}" stroke-width="${width}" stroke-linecap="round" stroke-linejoin="round"/>`;
const oval = (cx, cy, rx, ry, fill, stroke = ink, width = 5) =>
  p(`M${cx - rx} ${cy} C${cx - rx} ${cy - ry * 0.56} ${cx - rx * 0.56} ${cy - ry} ${cx} ${cy - ry} C${cx + rx * 0.56} ${cy - ry} ${cx + rx} ${cy - ry * 0.56} ${cx + rx} ${cy} C${cx + rx} ${cy + ry * 0.56} ${cx + rx * 0.56} ${cy + ry} ${cx} ${cy + ry} C${cx - rx * 0.56} ${cy + ry} ${cx - rx} ${cy + ry * 0.56} ${cx - rx} ${cy} Z`, fill, stroke).replace('stroke-width="5"', `stroke-width="${width}"`);
const circle = (cx, cy, r, fill, stroke = ink, width = 4) => oval(cx, cy, r, r, fill, stroke, width);
const pack = (slug, steps) => ({ slug, steps });

function pet(slug, coat, earColor, style) {
  const head = {
    cat: 'M151 200 L141 112 Q140 99 153 108 L213 151 C236 139 276 139 299 151 L359 108 Q372 99 371 112 L361 200 C376 248 343 293 302 305 C281 312 267 324 256 340 C245 324 231 312 210 305 C169 293 136 248 151 200 Z',
    dog: 'M145 183 C132 141 153 108 194 105 C223 102 241 117 256 128 C271 117 289 102 318 105 C359 108 380 141 367 183 C388 220 370 277 329 296 C303 309 278 314 256 334 C234 314 209 309 183 296 C142 277 124 220 145 183 Z',
    bunny: 'M162 197 C162 148 203 116 256 116 C309 116 350 148 350 197 C350 251 314 291 281 307 C271 312 263 324 256 338 C249 324 241 312 231 307 C198 291 162 251 162 197 Z',
    elephant: 'M156 190 C156 133 200 99 256 99 C312 99 356 133 356 190 C356 249 322 293 282 306 C268 311 263 323 256 337 C249 323 244 311 230 306 C190 293 156 249 156 190 Z',
    animal: 'M148 195 C148 135 195 101 256 101 C317 101 364 135 364 195 C364 252 330 293 288 306 C272 311 265 324 256 338 C247 324 240 311 224 306 C182 293 148 252 148 195 Z',
  }[style];
  const ears = {
    cat: [p('M155 180 L148 112 Q147 102 157 110 L214 151 Z', earColor), p('M357 180 L364 112 Q365 102 355 110 L298 151 Z', earColor)],
    dog: [p('M157 145 C126 133 112 159 123 211 C131 249 155 262 177 234 Z', coat), p('M355 145 C386 133 400 159 389 211 C381 249 357 262 335 234 Z', coat)],
    bunny: [p('M204 143 C188 106 181 49 198 38 C218 24 239 82 244 127 Z', coat), p('M268 127 C273 82 294 24 314 38 C331 49 324 106 308 143 Z', coat), p('M207 116 C199 82 197 58 202 53 C211 62 223 94 227 120 Z', earColor), p('M285 120 C289 94 301 62 310 53 C315 58 313 82 305 116 Z', earColor)],
    elephant: [p('M176 169 C126 135 96 161 109 224 C120 276 157 283 190 251 Z', coat), p('M336 169 C386 135 416 161 403 224 C392 276 355 283 322 251 Z', coat)],
    animal: [p('M181 157 L159 99 L218 139 Z', coat), p('M331 157 L353 99 L294 139 Z', coat)],
  }[style];
  const body = style === 'cat'
    ? 'M203 296 C166 322 151 372 164 422 C171 451 205 459 229 439 L256 411 L283 439 C307 459 341 451 348 422 C361 372 346 322 309 296 C286 309 273 316 256 316 C239 316 226 309 203 296 Z'
    : style === 'bunny'
      ? 'M203 294 C170 327 164 374 183 418 C197 449 229 452 256 428 C283 452 315 449 329 418 C348 374 342 327 309 294 C291 306 275 313 256 313 C237 313 221 306 203 294 Z'
      : 'M184 294 C155 329 151 380 171 422 C186 454 225 457 256 428 C287 457 326 454 341 422 C361 380 357 329 328 294 C304 309 281 316 256 316 C231 316 208 309 184 294 Z';
  const muzzle = style === 'elephant'
    ? p('M257 215 C280 217 300 237 299 262 C298 291 283 312 267 311 C250 310 250 293 259 280 C270 265 270 250 256 242 Z', earColor)
    : p('M218 230 C230 214 244 210 256 222 C268 210 282 214 294 230 C290 255 274 270 256 272 C238 270 222 255 218 230 Z', '#FFF0D9');
  const tail = style === 'cat'
    ? p('M326 373 C386 341 402 383 373 415 C358 431 339 430 327 418 C352 414 363 399 359 387 C355 375 341 377 326 391 Z', coat)
    : style === 'dog'
      ? line('M337 374 C376 387 389 364 377 348', ink, 12)
      : style === 'bunny'
        ? circle(335, 379, 24, '#FFF0D9')
        : style === 'elephant'
          ? line('M343 367 C365 379 372 396 369 414', ink, 7)
          : line('M338 376 C358 384 367 399 361 414', ink, 7);
  const eyes = [oval(218, 214, 15, 20, '#FFF9EF'), oval(294, 214, 15, 20, '#FFF9EF'), oval(221, 216, 6, 11, '#392B28'), oval(291, 216, 6, 11, '#392B28'), circle(223, 211, 2.5, '#FFFFFF', 'none', 1), circle(293, 211, 2.5, '#FFFFFF', 'none', 1)];
  const earsStage = style === 'bunny' ? ears : [ ...ears, p(style === 'cat' ? 'M157 126 L160 166 L192 148 Z' : 'M153 153 Q164 137 177 153 Q166 161 153 153 Z', '#F4B0A0', '#B96C61') ];
  const nose = style === 'elephant'
    ? [oval(217, 216, 12, 15, '#342B28'), oval(295, 216, 12, 15, '#342B28')]
    : [p('M247 250 Q256 242 265 250 Q261 261 256 262 Q251 261 247 250 Z', '#D77972'), line('M256 261 C256 273 246 281 236 278 M256 261 C256 273 266 281 276 278', ink, 3.5)];
  const whiskers = style === 'cat'
    ? [line('M209 256 C184 249 165 249 147 254 M207 266 C183 265 166 270 151 279 M303 256 C328 249 347 249 365 254 M305 266 C329 265 346 270 361 279', '#72554A', 3)]
    : style === 'dog'
      ? [oval(256, 241, 43, 29, '#FFF5E7'), circle(256, 226, 9, '#3C2C27'), line('M256 235 V256 C250 266 241 268 234 262 M256 256 C262 266 271 268 278 262', ink, 3.5)]
      : style === 'elephant'
        ? [p('M244 279 C251 269 261 269 268 279 C264 291 257 295 250 291 Z', '#5A4238'), line('M258 292 C261 307 269 313 277 310', ink, 3.5)]
        : [line('M256 256 V271 C250 279 243 280 237 276 M256 271 C262 279 269 280 275 276', ink, 3.5)];
  const markings = style === 'cat'
    ? [line('M209 174 L220 186 M256 160 V180 M303 174 L292 186', '#B66B44', 5), circle(236, 244, 3, '#C97D73', 'none'), circle(276, 244, 3, '#C97D73', 'none')]
    : style === 'dog'
      ? [p('M238 190 C240 170 273 170 276 190 C276 204 267 212 256 212 C245 212 238 204 238 190 Z', '#C68D61'), line('M195 346 C218 365 232 369 245 363 M267 363 C280 369 294 365 317 346', '#B16D45', 4)]
      : style === 'bunny'
        ? [circle(224, 253, 13, '#F2A5A0', 'none'), circle(288, 253, 13, '#F2A5A0', 'none'), line('M226 351 C239 369 273 369 286 351', '#C88575', 4)]
        : style === 'elephant'
          ? [oval(188, 230, 10, 16, '#F4C8CF'), oval(324, 230, 10, 16, '#F4C8CF'), line('M199 353 C220 367 235 369 246 363 M266 363 C277 369 292 367 313 353', '#8E7DAD', 4)]
          : [line('M208 348 C225 365 239 369 250 363 M262 363 C273 369 287 365 304 348', '#B98057', 4)];
  return pack(slug, [
    [p(body, coat)],
    [p(head, coat), ...earsStage],
    [muzzle, ...eyes],
    [...nose, tail],
    [...whiskers, ...markings],
  ]);
}

function fruit(slug, color, kind) {
  const body = {
    apple: 'M256 158 C226 137 190 139 164 163 C127 197 140 274 171 326 C195 367 225 388 256 371 C287 388 317 367 341 326 C372 274 385 197 348 163 C322 139 286 137 256 158 Z',
    pear: 'M256 135 C225 135 231 181 211 211 C177 262 151 302 177 348 C201 390 311 390 335 348 C361 302 335 262 301 211 C281 181 287 135 256 135 Z',
    orange: 'M256 137 C184 137 137 188 137 258 C137 330 184 377 256 377 C328 377 375 330 375 258 C375 188 328 137 256 137 Z',
    banana: 'M148 189 C184 136 248 118 315 137 C357 149 386 181 402 226 C422 283 384 346 316 373 C250 399 181 367 144 321 C183 337 233 335 275 316 C335 288 350 244 329 203 C303 156 221 150 148 189 Z',
    grapes: 'M257 163 C229 163 211 183 211 207 C181 207 164 229 164 254 C134 259 123 291 138 315 C151 340 182 348 204 333 C216 358 245 369 267 356 C288 371 320 359 330 335 C356 347 385 333 393 306 C401 278 383 252 355 250 C361 221 339 198 311 201 C305 177 284 163 257 163 Z',
    strawberry: 'M256 150 C224 124 174 137 159 176 C139 229 183 318 256 385 C329 318 373 229 353 176 C338 137 288 124 256 150 Z',
    watermelon: 'M128 202 C159 154 209 128 256 128 C303 128 353 154 384 202 L256 386 Z',
    peach: 'M256 164 C221 134 170 153 153 197 C132 252 168 334 219 365 C240 378 255 365 256 343 C258 365 273 378 294 365 C345 334 381 252 359 197 C342 153 291 134 256 164 Z',
    cherry: 'M182 220 C182 181 211 156 247 163 C273 168 287 190 284 215 C312 170 349 164 374 186 C401 210 391 256 358 271 C328 285 298 267 286 242 C281 280 249 302 216 292 C195 286 182 257 182 220 Z',
    lemon: 'M119 255 C156 195 202 161 256 161 C310 161 356 195 393 255 C356 315 310 349 256 349 C202 349 156 315 119 255 Z',
  }[kind];
  const leaf = kind === 'banana' ? 'M145 190 C113 177 102 154 111 137 C133 142 149 158 158 180 Z' :
    kind === 'watermelon' ? 'M248 130 C224 98 195 92 176 106 C196 131 221 144 249 147 M264 130 C289 98 318 92 337 106 C317 131 292 144 263 147 Z' :
    kind === 'cherry' ? 'M235 176 C225 124 216 103 194 85 M316 191 C315 137 331 111 357 96' :
    'M256 160 C236 130 204 125 187 141 C207 165 228 171 251 168 C267 137 292 127 316 140 C302 164 280 172 256 169 Z';
  const highlights = {
    apple: [line('M183 201 C174 232 181 269 197 291', '#FFD9C7', 8), line('M256 158 C253 143 257 132 266 122', '#704C3B', 5)],
    pear: [line('M205 243 C188 277 185 307 199 328', '#E5F0A9', 8)],
    orange: [line('M187 211 C175 234 173 262 181 281', '#FFD99A', 8)],
    banana: [line('M176 213 C205 186 241 178 274 187 M163 322 C194 347 231 355 262 350', '#FFE49A', 8)],
    grapes: [circle(214, 255, 11, '#DFC8F1', 'none'), circle(282, 225, 10, '#DFC8F1', 'none'), circle(242, 306, 9, '#DFC8F1', 'none')],
    strawberry: [circle(218, 222, 5, '#FFE2A6', 'none'), circle(292, 221, 5, '#FFE2A6', 'none'), circle(187, 270, 5, '#FFE2A6', 'none'), circle(255, 280, 5, '#FFE2A6', 'none'), circle(325, 271, 5, '#FFE2A6', 'none'), circle(229, 329, 5, '#FFE2A6', 'none'), circle(281, 329, 5, '#FFE2A6', 'none')],
    watermelon: [line('M154 212 Q256 126 358 212 M177 235 Q256 174 335 235', '#F5A58E', 6), circle(231, 279, 5, '#3E332D', 'none'), circle(282, 305, 5, '#3E332D', 'none'), circle(308, 267, 5, '#3E332D', 'none')],
    peach: [line('M256 174 C245 235 245 287 256 343', '#D07A58', 4), line('M188 220 C177 250 187 286 205 303', '#FFE0C2', 8)],
    cherry: [line('M244 164 C253 121 273 99 300 88 M343 181 C340 143 349 119 370 102', '#527B45', 7), circle(218, 216, 8, '#F7B1A2', 'none')],
    lemon: [line('M179 244 C211 211 244 199 276 203', '#FFF2A8', 8)],
  }[kind];
  const upper = kind === 'watermelon' ? '#64A65F' : color;
  const inside = kind === 'watermelon' ? p('M142 211 Q256 128 370 211 L256 363 Z', '#F28A7B') :
    kind === 'banana' ? null : null;
  const base = [p(body, upper)];
  if (inside) base.push(inside);
  return pack(slug, [
    base,
    [line(leaf, '#568047', 8), p(kind === 'watermelon' ? 'M130 202 Q256 105 382 202 L370 220 Q256 144 142 220 Z' : 'M246 165 Q256 133 267 165 L264 185 L248 185 Z', kind === 'watermelon' ? '#3F7E4A' : '#8D633D')],
    highlights,
    kind === 'orange' ? [line('M222 274 Q256 297 290 274', '#E78E41', 5), line('M256 215 V251', '#E78E41', 5)] :
      kind === 'lemon' ? [line('M221 285 Q256 305 291 285', '#DDAF45', 5)] :
      kind === 'grapes' ? [line('M257 162 V207', '#58824A', 7)] :
      kind === 'apple' ? [line('M229 201 Q256 220 283 201', '#E77E71', 4)] : [],
    [line(kind === 'watermelon' ? 'M256 149 V203' : 'M256 182 V196', '#704C3B', 4)],
  ]);
}

function vegetable(slug, color, kind) {
  const body = {
    carrot: 'M209 183 C238 193 274 193 303 183 C293 257 279 335 256 400 C233 335 219 257 209 183 Z',
    tomato: 'M256 163 C227 139 193 144 171 163 C132 198 142 267 173 311 C197 345 226 358 256 340 C286 358 315 345 339 311 C370 267 380 198 341 163 C319 144 285 139 256 163 Z',
    cucumber: 'M190 137 C154 139 137 174 139 256 C141 338 158 373 194 375 C233 378 279 366 318 365 C354 363 373 330 373 256 C373 182 354 149 318 147 C279 146 230 135 190 137 Z',
    pepper: 'M256 162 C221 142 189 151 171 181 C148 218 159 293 185 330 C205 360 233 355 256 330 C279 355 307 360 327 330 C353 293 364 218 341 181 C323 151 291 142 256 162 Z',
    potato: 'M178 191 C198 153 246 143 280 153 C326 139 369 171 366 215 C390 253 367 306 336 320 C317 359 260 369 225 351 C180 359 146 326 151 285 C132 250 146 208 178 191 Z',
    broccoli: 'M256 149 C221 120 181 145 178 180 C139 173 116 204 126 239 C99 269 118 311 155 318 C163 353 199 370 227 349 L285 349 C313 370 349 353 357 318 C394 311 413 269 386 239 C396 204 373 173 334 180 C331 145 291 120 256 149 Z',
    onion: 'M256 142 C224 167 181 176 165 222 C144 281 171 350 222 375 C243 386 269 386 290 375 C341 350 368 281 347 222 C331 176 288 167 256 142 Z',
    cabbage: 'M256 151 C221 123 177 143 172 181 C132 177 113 215 133 249 C105 281 132 325 170 325 C177 365 220 378 256 350 C292 378 335 365 342 325 C380 325 407 281 379 249 C399 215 380 177 340 181 C335 143 291 123 256 151 Z',
    corn: 'M209 145 C230 126 282 126 303 145 C326 220 326 315 286 370 C271 389 241 389 226 370 C186 315 186 220 209 145 Z',
    pumpkin: 'M256 173 C222 147 184 157 164 185 C135 224 139 295 164 334 C183 363 218 371 256 348 C294 371 329 363 348 334 C373 295 377 224 348 185 C328 157 290 147 256 173 Z',
  }[kind];
  const leaves = {
    carrot: [p('M247 194 C218 159 205 133 216 111 C238 126 250 151 254 187 Z', '#73A95D'), p('M256 190 C254 146 270 111 294 102 C299 134 283 167 263 194 Z', '#82B86B'), p('M258 190 C284 159 310 149 329 160 C313 182 286 196 258 202 Z', '#639B55')],
    tomato: [p('M256 171 C240 142 212 144 198 158 C217 159 231 173 242 188 C222 179 204 185 194 199 C216 198 234 202 250 217 C256 195 266 183 282 173 C300 163 317 168 329 184 C306 180 286 190 271 208 C292 198 314 202 326 218 C303 220 280 229 256 241 C246 213 240 190 256 171 Z', '#6FA75D')],
    cucumber: [line('M173 213 C207 196 224 197 249 214 M183 272 C214 255 234 256 258 274 M260 326 C289 300 315 302 338 316', '#5D9C63', 5)],
    pepper: [p('M255 180 C247 146 254 123 274 110 C291 134 285 159 270 183 Z', '#6FA75D')],
    potato: [circle(199, 224, 7, '#A46D4A'), circle(319, 250, 7, '#A46D4A'), circle(238, 316, 6, '#A46D4A'), circle(291, 190, 5, '#A46D4A')],
    broccoli: [p('M238 327 L274 327 L290 389 Q256 405 222 389 Z', '#84B76D')],
    onion: [p('M256 142 C243 109 251 91 256 82 C261 91 269 109 256 142 Z', '#709C54'), line('M256 151 C231 117 209 111 195 115 M256 151 C282 116 303 111 318 116', '#709C54', 7)],
    cabbage: [line('M256 157 C222 201 216 269 256 350 M256 157 C290 201 296 269 256 350 M180 216 C208 235 228 267 241 308 M332 216 C304 235 284 267 271 308', '#6E9F61', 5)],
    corn: [p('M216 185 C183 224 180 285 216 347 C219 280 229 226 250 177 Z', '#79B56B'), p('M296 185 C329 224 332 285 296 347 C293 280 283 226 262 177 Z', '#79B56B')],
    pumpkin: [p('M249 173 C242 145 247 124 259 116 C271 130 270 150 264 175 Z', '#65944D')],
  }[kind];
  const texture = {
    carrot: [line('M224 241 L242 248 M230 287 L247 292 M239 333 L252 337', '#E99045', 4)],
    tomato: [line('M194 231 C205 218 219 216 229 226 M283 227 C295 216 309 219 318 232', '#F5B19A', 6)],
    cucumber: [line('M183 172 L190 181 M333 210 L341 219 M176 318 L184 327 M313 337 L321 346', '#D1E7A7', 6)],
    pepper: [line('M211 209 C201 254 209 296 231 320 M301 207 C313 249 307 287 284 316', '#A7D88A', 6)],
    potato: [line('M188 270 C208 254 222 259 232 270 M294 220 C310 209 326 216 332 228', '#E8D2AE', 6)],
    broccoli: [circle(198, 220, 11, '#A8D884', 'none'), circle(258, 190, 12, '#A8D884', 'none'), circle(317, 225, 11, '#A8D884', 'none'), circle(176, 278, 10, '#A8D884', 'none'), circle(337, 277, 10, '#A8D884', 'none')],
    onion: [line('M201 238 C186 279 198 320 222 338 M311 238 C326 279 314 320 290 338', '#EBD2A7', 6)],
    cabbage: [line('M190 275 C204 318 224 333 244 339 M322 275 C308 318 288 333 268 339', '#A5CE87', 6)],
    corn: [circle(237, 208, 5, '#FFF2A6', 'none'), circle(270, 230, 5, '#FFF2A6', 'none'), circle(237, 253, 5, '#FFF2A6', 'none'), circle(270, 277, 5, '#FFF2A6', 'none'), circle(239, 304, 5, '#FFF2A6', 'none'), circle(267, 330, 5, '#FFF2A6', 'none')],
    pumpkin: [line('M256 174 C232 217 231 292 256 349 M256 174 C281 217 281 292 256 349 M214 184 C195 230 199 298 222 347 M298 184 C317 230 313 298 290 347', '#D77E3E', 5)],
  }[kind];
  return pack(slug, [
    [p(body, color)],
    leaves,
    texture,
    kind === 'corn' ? [line('M226 181 C238 160 274 160 286 181', '#D2A934', 4)] :
      kind === 'onion' ? [line('M226 350 Q256 369 286 350', '#C69D77', 4)] : [],
    [line(kind === 'broccoli' ? 'M236 383 H276' : 'M256 181 V191', kind === 'broccoli' ? '#70985A' : '#699052', 4)],
  ]);
}

function vehicle(slug, color, kind) {
  if (kind === 'boat') return pack(slug, [
    [p('M115 302 H397 L365 368 Q256 410 147 368 Z', color)],
    [p('M224 207 H318 L351 302 H190 Z', '#C8E5EF'), p('M250 207 V127 H265 V207 Z', '#9A704E'), p('M252 139 L252 264 L168 264 Z', '#F7E9C8')],
    [line('M172 337 Q205 355 238 337 M274 337 Q307 355 340 337', '#FFF7E8', 7), line('M120 397 Q158 382 196 397 T272 397 T348 397 T416 397', '#70BBD2', 6)],
    [p('M211 226 H250 V278 H211 Z', '#F4F7F2'), p('M276 226 H314 L331 278 H276 Z', '#F4F7F2')],
    [line('M156 302 V277 M356 302 V277', '#B25B45', 5)],
  ]);
  if (kind === 'helicopter') return pack(slug, [
    [p('M150 245 C150 190 203 160 273 171 C329 180 365 216 365 260 C365 304 329 330 273 331 H224 C179 331 150 298 150 260 Z', color)],
    [p('M329 235 L409 194 L432 205 L365 270 Z', '#6FA7C8'), p('M137 246 H110 V259 H150 Z', '#83B6D0')],
    [p('M211 192 C240 178 279 186 296 211 V285 H211 Z', '#D7EEF2'), line('M181 340 H350 M265 330 V340 M236 352 H295', '#58483F', 6)],
    [line('M256 172 V119 M170 116 H342 M256 116 V92', '#58483F', 7), line('M122 193 H191 M153 177 V209', '#58483F', 6)],
    [line('M198 301 H316', '#D3EBEF', 6), circle(382, 231, 7, '#F3CB69')],
  ]);
  if (kind === 'drill') return pack(slug, [
    [p('M194 121 H310 Q333 121 333 144 V273 H194 Z', color)],
    [p('M194 184 H137 Q117 184 117 205 V303 Q117 323 137 323 H194 Z', '#6D99B5'), p('M217 272 H292 V383 Q292 400 275 400 H234 Q217 400 217 383 Z', '#E8A856')],
    [p('M256 401 H274 L267 472 H263 Z', '#8797A1'), circle(256, 153, 14, '#E7F1EA'), line('M238 153 H274', '#6D99B5', 4)],
    [line('M224 205 H303 M224 226 H303', '#3D6D84', 5), line('M235 328 V376 M273 328 V376', '#D79243', 4)],
    [circle(315, 143, 7, '#F4D16D'), line('M235 420 L267 451', '#B3C4CA', 4)],
  ]);
  if (kind === 'mixer') return pack(slug, [
    [p('M91 278 H257 V345 H119 Q91 345 91 317 Z', color)],
    [p('M247 222 C278 198 343 207 370 238 C397 269 390 320 361 340 C330 362 270 346 247 316 C228 291 225 244 247 222 Z', '#86B8C5')],
    [circle(151, 357, 37, '#4E4A48'), circle(151, 357, 17, '#DBD5C9'), circle(341, 357, 37, '#4E4A48'), circle(341, 357, 17, '#DBD5C9'), p('M113 244 H190 L217 278 H113 Z', '#D7EDF1')],
    [line('M276 225 L350 331 M306 214 L374 312', '#E0F3F4', 8), line('M228 273 L263 256', ink, 8)],
    [circle(119, 291, 8, '#F6D06D'), line('M88 278 H118', '#F6D06D', 6)],
  ]);
  const forms = {
    car: ['M92 309 C92 282 112 264 146 263 L179 208 Q187 194 205 194 H309 Q327 194 338 210 L377 263 H402 Q425 263 425 287 V320 Q425 340 405 340 H381 C376 367 357 383 331 383 C305 383 286 367 281 340 H223 C218 367 199 383 173 383 C147 383 128 367 123 340 H110 Q92 340 92 322 Z', 'M189 254 H253 V214 H207 Z M268 214 V254 H352 L322 214 Z'],
    truck: ['M86 247 H276 V337 H86 Z M276 277 H349 L397 317 V337 H276 Z', 'M299 291 H341 L371 317 H299 Z'],
    van: ['M89 246 Q89 222 116 222 H342 Q370 222 389 250 L414 292 V339 H89 Z', 'M119 245 H228 V286 H119 Z M246 245 H332 Q350 245 364 286 H246 Z'],
    tractor: ['M113 292 H185 L206 251 H305 L357 292 H400 V338 H113 Z', 'M221 185 H304 L324 290 H190 Z'],
    firetruck: ['M82 269 H250 V333 H82 Z M250 289 H330 L375 321 V333 H250 Z', 'M267 301 H321 L349 322 H267 Z'],
    police: ['M93 281 Q93 253 123 253 H265 V337 H93 Z M265 283 H345 L387 318 V337 H265 Z', 'M281 294 H337 L365 318 H281 Z'],
    vehicle: ['M83 291 L117 245 Q130 228 153 228 H339 Q359 228 374 248 L417 291 V337 H83 Z', 'M145 246 H250 V282 H119 Z M268 246 H336 Q350 246 369 282 H268 Z'],
    harvester: ['M70 290 H310 V350 H70 Z M310 264 H370 L398 300 V350 H310 Z', 'M319 278 H362 L384 300 H319 Z'],
  };
  const [body, glass] = forms[kind] || forms.vehicle;
  const steps = [[p(body, color)]];
  if (kind === 'tractor') {
    steps.push([circle(165, 337, 60, '#4D4946'), circle(165, 337, 28, '#D8D1C4'), circle(360, 337, 34, '#4D4946'), circle(360, 337, 16, '#D8D1C4')]);
    steps.push([p(glass, '#D7EDF2'), line('M189 288 H318', '#E8A75C', 10), line('M214 193 V283', '#6E8A65', 6)]);
  } else if (kind === 'harvester') {
    steps.push([circle(161, 352, 53, '#4D4946'), circle(161, 352, 25, '#D8D1C4'), circle(350, 352, 34, '#4D4946'), circle(350, 352, 15, '#D8D1C4')]);
    steps.push([p(glass, '#D7EDF2'), line('M96 373 H409 M102 373 L82 414 M148 373 L144 414 M192 373 L207 414', '#C49D52', 7)]);
  } else {
    steps.push([circle(166, 346, 44, '#4D4946'), circle(166, 346, 21, '#D8D1C4'), circle(350, 346, 44, '#4D4946'), circle(350, 346, 21, '#D8D1C4')]);
    steps.push([p(glass, '#D7EDF2'), line('M224 258 V214 M224 214 H188', '#FFF1D4', 5)]);
  }
  if (kind === 'firetruck') steps.push([line('M157 235 H349 M169 221 H336 M185 207 H321', '#F2D18B', 7), line('M190 207 V235 M230 207 V235 M270 207 V235 M310 207 V235', '#F2D18B', 5), circle(123, 254, 12, '#FFD45E')]);
  else if (kind === 'police') steps.push([p('M215 240 H276 L263 219 H229 Z', '#F3D15E'), line('M111 307 H232', '#EDF5F1', 7)]);
  else if (kind === 'truck') steps.push([line('M104 263 H258 M120 277 H247 M299 303 H341', '#F1D197', 5)]);
  else if (kind === 'van') steps.push([line('M105 305 H389 M263 232 V333', '#DCE9DF', 5)]);
  else steps.push([line('M111 309 H396', '#F7E2B3', 5), circle(394, 294, 8, '#F4D16D')]);
  steps.push([line('M111 365 H218 M300 365 H392', '#8F9CA0', 4)]);
  return pack(slug, steps);
}

function building(slug, color, kind) {
  if (kind === 'snowman') return pack(slug, [
    [oval(256, 337, 112, 91, '#EAF4F6'), oval(256, 232, 82, 71, '#F6FBF9'), oval(256, 145, 56, 49, '#F6FBF9')],
    [p('M203 119 H309 L294 94 H218 Z', '#6C87A0'), line('M218 94 H294', '#49372F', 6), p('M255 150 L304 160 L255 170 Z', '#ECA358')],
    [circle(237, 139, 5, '#40342E'), circle(274, 139, 5, '#40342E'), line('M245 185 Q256 195 267 185', '#9D6653', 4)],
    [p('M178 244 C215 270 296 270 334 244 L328 270 C285 292 222 292 184 270 Z', '#86B7C8'), line('M216 275 L207 309 M294 275 L304 308', '#86B7C8', 10)],
    [circle(256, 237, 6, '#8F654A'), circle(256, 267, 6, '#8F654A'), circle(256, 326, 7, '#8F654A'), circle(256, 356, 7, '#8F654A'), line('M172 313 L116 282 M340 313 L396 282', '#8A684E', 6)],
  ]);
  if (kind === 'playground') return pack(slug, [
    [p('M102 360 H410 L376 405 H139 Z', '#F1C979'), line('M142 360 V200 H241 V360 M299 360 V200 H367 V360', color, 15)],
    [p('M142 200 L191 148 L241 200 Z', '#E99C68'), line('M190 149 V106', color, 9), circle(190, 102, 12, '#F4D16D')],
    [p('M298 201 H367 V256 H298 Z', '#B9D9E9'), line('M299 256 L382 360 H343 L299 306 Z', '#74B6CB', 7)],
    [line('M175 254 H209 M175 280 H209 M175 306 H209 M175 332 H209', '#FFF3D6', 5), p('M270 360 V316 H301 V360 Z', '#F4AC72')],
    [line('M102 414 H410 M115 428 H398', '#86BE8C', 7)],
  ]);
  if (kind === 'robot') return pack(slug, [
    [p('M174 164 Q174 136 202 136 H310 Q338 136 338 164 V270 H174 Z', color), p('M195 270 H317 V370 H195 Z', '#A8C9D5')],
    [line('M256 135 V104 M236 105 H276', ink, 7), circle(256, 93, 13, '#F2C55D')],
    [circle(218, 203, 15, '#F8E8BD'), circle(294, 203, 15, '#F8E8BD'), circle(218, 203, 7, '#3C3735'), circle(294, 203, 7, '#3C3735'), line('M226 239 Q256 259 286 239', ink, 5)],
    [p('M145 190 H174 V279 H145 Z', '#E1A66B'), p('M338 190 H367 V279 H338 Z', '#E1A66B'), line('M219 301 H293 M219 326 H293', '#76A6B6', 5)],
    [p('M213 370 V413 H239 V390 H273 V413 H299 V370 Z', '#8798AE'), circle(256, 302, 6, '#E88475')],
  ]);
  const roof = {
    house: 'M91 231 L256 95 L421 231 V390 Q421 414 397 414 H115 Q91 414 91 390 Z',
    small_house: 'M113 244 L256 131 L399 244 V383 Q399 404 378 404 H134 Q113 404 113 383 Z',
    villa: 'M82 232 L256 91 L430 232 V399 Q430 420 409 420 H103 Q82 420 82 399 Z',
    school: 'M76 230 L256 101 L436 230 V395 H76 Z',
    bakery: 'M103 232 L256 121 L409 232 V399 H103 Z',
    tower: 'M160 144 H352 V414 H160 Z',
    apartment: 'M132 130 H380 V414 H132 Z',
    castle: 'M89 185 H160 V125 H225 V180 H287 V125 H352 V185 H423 V414 H89 Z',
    sun_house: 'M88 245 L256 108 L424 245 V404 H88 Z',
  }[kind] || 'M91 231 L256 95 L421 231 V390 Q421 414 397 414 H115 Q91 414 91 390 Z';
  const steps = [[p(roof, color)]];
  if (kind === 'tower' || kind === 'apartment') {
    steps.push([p(kind === 'tower' ? 'M198 144 V90 Q256 40 314 90 V144 Z' : 'M180 130 V85 H332 V130 Z', '#D89E6A')]);
    steps.push([p('M180 179 H226 V222 H180 Z M286 179 H332 V222 H286 Z M180 250 H226 V293 H180 Z M286 250 H332 V293 H286 Z M180 321 H226 V364 H180 Z M286 321 H332 V364 H286 Z', '#B8DCE7')]);
  } else if (kind === 'castle') {
    steps.push([p('M89 185 L124 120 L160 185 Z M352 185 L388 120 L423 185 Z', '#D4B5E4')]);
    steps.push([p('M222 414 V306 Q256 260 290 306 V414 Z', '#765D68'), p('M130 227 H174 V271 H130 Z M338 227 H382 V271 H338 Z', '#B8DCE7')]);
  } else {
    steps.push([p('M151 230 H219 V290 H151 Z M293 230 H361 V290 H293 Z', '#B9DFE8'), p(kind === 'school' ? 'M226 414 V302 H286 V414 Z' : 'M220 414 V299 H292 V414 Z', '#8B6452')]);
    steps.push([line('M121 205 L256 95 L391 205', '#F5E3B4', 8), line('M176 329 H210 M302 329 H336', '#86B982', 6)]);
  }
  if (kind === 'school') steps.push([circle(256, 168, 22, '#F2D071'), line('M256 145 V191 M233 168 H279', '#FFF5D7', 4), line('M70 414 H442', '#6B9B66', 8)]);
  else if (kind === 'bakery') steps.push([p('M114 235 H398 V280 H114 Z', '#E99583'), line('M137 235 V280 M184 235 V280 M231 235 V280 M278 235 V280 M325 235 V280 M372 235 V280', '#FFF0D7', 5), circle(370, 176, 11, '#F2CE69')]);
  else if (kind === 'sun_house') steps.push([circle(381, 120, 37, '#F4CF67'), line('M380 67 V48 M380 192 V173 M327 120 H308 M452 120 H433 M343 83 L329 69 M431 171 L417 157', '#E9B952', 6)]);
  else steps.push([line('M131 414 H381', '#6F9D6D', 7)]);
  steps.push([line('M145 425 H367', '#E0C28D', 4), circle(390, 394, 5, '#F2CE69')]);
  return pack(slug, steps);
}

const art = [
  pet('cat', '#EBA56E', '#F2B1A0', 'cat'), pet('dog', '#C98652', '#E5B88B', 'dog'), pet('bunny', '#E8D3BE', '#E9A8A7', 'bunny'),
  pack('fish', [[p('M115 256 C158 170 266 150 345 211 L414 166 V346 L345 301 C266 362 158 342 115 256 Z', '#75C9D3')], [p('M117 256 L68 198 V314 Z', '#F1A86D'), p('M231 188 Q256 144 283 184 Q258 209 231 188 Z', '#F3D070'), p('M231 324 Q256 368 283 328 Q258 303 231 324 Z', '#F3D070')], [oval(169, 233, 18, 22, '#FFF8E8'), oval(173, 234, 8, 13, '#3B302B'), line('M222 215 Q256 256 222 297 M260 207 Q290 256 260 305', '#4D94A0', 5)], [line('M310 223 Q332 256 310 289 M277 227 Q295 256 277 285', '#D8F0E7', 6), line('M188 286 Q214 299 235 293', '#E9FAEF', 5)], [circle(150, 225, 4, '#FFFFFF', 'none', 1), circle(288, 245, 5, '#F3E0A5')]]),
  pack('penguin', [[p('M256 86 C186 86 142 145 142 235 V292 C142 374 190 430 256 430 C322 430 370 374 370 292 V235 C370 145 326 86 256 86 Z', '#435A6B')], [p('M190 261 C196 211 220 184 256 184 C292 184 316 211 322 261 V333 C310 371 285 394 256 394 C227 394 202 371 190 333 Z', '#FFF4DF'), p('M143 255 C120 244 99 255 95 282 C91 314 111 342 148 355 Z M369 255 C392 244 413 255 417 282 C421 314 401 342 364 355 Z', '#536E83')], [oval(220, 208, 14, 18, '#FFF8EA'), oval(292, 208, 14, 18, '#FFF8EA'), oval(223, 210, 6, 10, '#332A27'), oval(289, 210, 6, 10, '#332A27'), p('M239 246 L273 246 L256 270 Z', '#E6A054')], [line('M227 310 Q256 331 285 310 M222 352 Q256 369 290 352', '#D8B7A2', 5), p('M169 142 Q256 168 343 142 L338 166 Q256 190 174 166 Z', '#D76F64')], [circle(256, 155, 7, '#F3D36B'), line('M180 314 Q194 324 205 322 M307 322 Q318 324 332 314', '#BED4DB', 5)]]), pet('elephant', '#A9A3D2', '#D4B9CC', 'elephant'),
  pack('butterfly', [[p('M254 249 C205 167 132 143 103 188 C72 237 128 283 214 278 C126 287 108 350 152 374 C193 397 235 337 256 282 C277 337 319 397 360 374 C404 350 386 287 298 278 C384 283 440 237 409 188 C380 143 307 167 258 249 Z', '#8FC6D5')], [p('M240 249 C194 205 151 199 137 223 C126 246 159 265 221 266 Z M272 249 C318 205 361 199 375 223 C386 246 353 265 291 266 Z', '#EAA6B4'), p('M218 291 C174 302 156 330 171 346 C190 364 219 337 241 296 Z M294 291 C338 302 356 330 341 346 C322 364 293 337 271 296 Z', '#F0CE71')], [oval(256, 281, 18, 79, '#5D5268'), circle(256, 205, 10, '#5D5268'), line('M248 202 Q220 159 195 159 M264 202 Q292 159 317 159', '#5D5268', 5)], [circle(160, 235, 12, '#F7D5DB'), circle(352, 235, 12, '#F7D5DB'), circle(171, 329, 9, '#FFF0CD'), circle(341, 329, 9, '#FFF0CD')], [line('M240 249 C200 229 172 225 145 233 M272 249 C312 229 340 225 367 233', '#FFFFFF', 5)]]),
  pet('animal', '#D89B62', '#E8B282', 'animal'),
  vehicle('car', '#5AB3D3', 'car'), vehicle('truck', '#E58A70', 'truck'), vehicle('van', '#78BBA4', 'van'), vehicle('tractor', '#78AA55', 'tractor'), vehicle('firetruck', '#E75F52', 'firetruck'), vehicle('police', '#6D9FC8', 'police'),
  building('house', '#F0C56B', 'house'), building('small_house', '#E5B875', 'small_house'), building('villa', '#E9A777', 'villa'), building('playground', '#8BC3A3', 'playground'), vehicle('boat', '#57B3C5', 'boat'), building('sun_house', '#F0C56B', 'sun_house'), building('snowman', '#A5CBD9', 'snowman'),
  fruit('apple', '#E56F69', 'apple'), fruit('pear', '#A8C86A', 'pear'), fruit('orange', '#F0A34E', 'orange'), fruit('banana', '#EAC34E', 'banana'), fruit('grapes', '#9870B8', 'grapes'), fruit('strawberry', '#E96F79', 'strawberry'), fruit('watermelon', '#6EAC64', 'watermelon'), fruit('peach', '#EFA37F', 'peach'), fruit('cherry', '#D95F69', 'cherry'), fruit('lemon', '#E3C64F', 'lemon'),
  vegetable('carrot', '#ED984A', 'carrot'), vegetable('tomato', '#E97868', 'tomato'), vegetable('cucumber', '#6EAE6F', 'cucumber'), vegetable('pepper', '#70B879', 'pepper'), vegetable('potato', '#C8A274', 'potato'), vegetable('broccoli', '#76AD68', 'broccoli'), vegetable('onion', '#D7B68A', 'onion'), vegetable('cabbage', '#80B66D', 'cabbage'), vegetable('corn', '#E7C44E', 'corn'), vegetable('pumpkin', '#E88D49', 'pumpkin'),
  building('school', '#79B2D1', 'school'), building('castle', '#B69BD0', 'castle'), building('bakery', '#DDA080', 'bakery'), building('tower', '#A895C2', 'tower'), building('apartment', '#C99D8B', 'apartment'), building('robot', '#78AAB8', 'robot'), vehicle('mixer', '#789EAC', 'mixer'), vehicle('drill', '#7598B1', 'drill'), vehicle('harvester', '#D9B14E', 'harvester'), vehicle('helicopter', '#8EA5D1', 'helicopter'), vehicle('vehicle', '#6FA5C5', 'vehicle'),
];

function svgFor(elements) {
  return [
    '<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512">',
    `<rect width="512" height="512" fill="${paper}"/>`,
    '<g opacity="0.98">',
    ...elements.map((element) => `  ${element}`),
    '</g>',
    '</svg>',
  ].join('\n') + '\n';
}

const slugs = new Set();
for (const item of art) {
  if (slugs.has(item.slug)) throw new Error(`Duplicate artwork: ${item.slug}`);
  slugs.add(item.slug);
  if (item.steps.length !== 5) throw new Error(`${item.slug} must have five steps`);
  const folder = path.join(root, item.slug);
  fs.mkdirSync(folder, { recursive: true });
  const cumulative = [];
  for (let index = 0; index < 5; index += 1) {
    cumulative.push(...item.steps[index]);
    fs.writeFileSync(path.join(folder, `step_${String(index + 1).padStart(2, '0')}.svg`), svgFor(cumulative));
  }
  fs.writeFileSync(path.join(folder, 'final_preview.svg'), svgFor(cumulative));
}

console.log(`Generated ${art.length} illustrated lesson packs.`);

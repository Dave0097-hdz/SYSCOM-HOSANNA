<?php

$base_url = "http://localhost/proyectointegrador/";

require "../../Config/config.php";
require "../../Config/database.php";

?>
    <div>
        <h1 style="font-size: 70px; text-align: center; text-decoration: double;">Seccion de productos</h1>
    </div>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRODUCTOS - HOSANNA</title>
    <link rel="shortcut icon" href="<?php echo BASE_URL . 'Assets/img/Logo_Hossna.png' ?>" type="image/x-icon">
    <link rel="stylesheet" href="<?php echo BASE_URL . 'Assets/css/normalize.css' ?>">
    <link rel="stylesheet" href="<?php echo BASE_URL . 'Assets/css/estilos.css' ?>">

    <meta name="theme-color" content="#2091F9">
</head>

<body>

    <header class="hero">
        <nav class="nav container">
            <div class="nav__logo">
                <h2 class="nav__title">PRODUCTOS - HOSANNA</h2>
            </div>

            <ul class="nav__link nav__link--menu">
                <li class="nav__items">
                    <a href="<?php echo BASE_URL . 'index.php' ?>" class="nav__links">Inicio</a>
                </li>

                <img src="<?php echo BASE_URL . 'Assets/img/close.svg' ?>" class="nav__close">
            </ul>

            <div class="nav__menu">
                <img src="<?php echo BASE_URL . 'Assets/img/menu.svg' ?>" class="nav__img">
            </div>

            <div class="dropdown">
                <a href="#" class="dropbtn">Categorias</a>
                <div class="dropdown-content">
                    <li><a href="Views/pagina/productos.php?cat=1">Accesorios de música</a></li>
                    <li><a href="Views/pagina/productos.php?cat=2">Mochilas</a></li>
                    <li><a href="Views/pagina/productos.php?cat=4">Cinturones</a></li>
                    <li><a href="Views/pagina/productos.php?cat=3">Gorras</a></li>
                    <li><a href="Views/pagina/productos.php?cat=5">Bolsas de regalos</a></li>
                    <li><a href="Views/pagina/productos.php?cat=6">Articulos Electronicos</a></li>
                </div>
            </div>

            <li class="nav__items">
                <a href="#" class="nav__links">Servicios</a>
            </li>

        </nav>

        <section class="hero__container container">
            <h1 class="hero__title">Bienvenido a la seccion de Productos</h1>
            <p class="hero__paragraph">Vizualiza los mejores productos que ofrecemos, con la mejor calidad, precio y comodidad</p>
        </section>
    </header>

    <main>
        <section class="container about">
            <h2 class="subtitle">Productos de Calidad</h2>
            <p class="about__paragraph">Todo lo necesario y dispensable para su hogar</p>

            <div class="about__main">
                <article class="about__icons">
                    <img src="<?php echo BASE_URL . 'Assets/img/shapes.svg' ?>" class="about__icon">
                    <h3 class="about__title"></h3>
                    <p class="about__paragrah">Selecione la cantidad que desea, vizualice los mejores productos</p>
                </article>

                <article class="about__icons">
                    <img src="<?php echo BASE_URL . 'Assets/img/paint.svg' ?>" class="about__icon">
                    <h3 class="about__title">Animaciones</h3>
                    <p class="about__paragrah">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quae tempore
                        porro eius facilis?</p>
                </article>

                <article class="about__icons">
                    <img src="./images/code.svg" class="about__icon">
                    <h3 class="about__title">Sass</h3>
                    <p class="about__paragrah">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quae tempore
                        porro eius facilis?</p>
                </article>
            </div>
        </section>

        <section class="knowledge">
            <div class="knowledge__container container">
                <div class="knowledege__texts">
                    <h2 class="subtitle">Curso completo de CSS3. ¡Domina CSS de una vez por todas!</h2>
                    <p class="knowledge__paragraph">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi,
                        aliquam nemo in facere suscipit at delectus unde labore ad officia iste accusantium eaque
                        aperiam laborum est voluptate totam? Modi, obcaecati?</p>
                    <a href="#" class="cta">Entra al curso</a>
                </div>

                <figure class="knowledge__picture">
                    <img src="./images/macbook.png" class="knowledge__img">
                </figure>
            </div>
        </section>

        <section class="price container">
            <h2 class="subtitle">Obten el plan perfecto para aprender</h2>

            <div class="price__table">
                <div class="price__element">
                    <p class="price__name">Flexbox</p>
                    <h3 class="price__price">Free</h3>

                    <div class="price__items">
                        <p class="price__features">Flexbox</p>
                        <p class="price__features">Layouts</p>
                        <p class="price__features">Responsive</p>
                    </div>

                    <a href="#" class="price__cta">Empieza ahora</a>
                </div>


                <div class="price__element price__element--best">
                    <p class="price__name">Grid</p>
                    <h3 class="price__price">$30/mes</h3>

                    <div class="price__items">
                        <p class="price__features">Grid</p>
                        <p class="price__features">Implicit Grid</p>
                        <p class="price__features">Responsive</p>
                    </div>

                    <a href="#" class="price__cta">Empieza ahora</a>
                </div>


                <div class="price__element">
                    <p class="price__name">Animaciones</p>
                    <h3 class="price__price">$40/mes</h3>

                    <div class="price__items">
                        <p class="price__features">Animation</p>
                        <p class="price__features">Transition</p>
                        <p class="price__features">Render Website</p>
                    </div>

                    <a href="#" class="price__cta">Empieza ahora</a>
                </div>


            </div>
        </section>

        <section class="testimony">
            <div class="testimony__container container">
                <img src="./images/leftarrow.svg" class="testimony__arrow" id="before">

                <section class="testimony__body testimony__body--show" data-id="1">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Jordan Alexander, <span class="testimony__course">estudiante
                                de CSS.</span></h2>
                        <p class="testimony__review">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ut est
                            esse, asperiores eaque totam nulla repudiandae quasi, deserunt culpa exercitationem
                            blanditiis laborum veniam laboriosam saepe reiciendis dolorem. Cum, ratione voluptatum!</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="./images/face.jpg" class="testimony__img">
                    </figure>
                </section>

                <section class="testimony__body" data-id="2">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Alejandra Perez, <span class="testimony__course">estudiante de
                                CSS.</span></h2>
                        <p class="testimony__review">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ut est
                            esse, asperiores eaque laborum veniam laboriosam saepe reiciendis dolorem. Cum, ratione
                            voluptatum!</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="./images/face2.jpg" class="testimony__img">
                    </figure>
                </section>

                <section class="testimony__body" data-id="3">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Karen Arteaga, <span class="testimony__course">estudiante de
                                CSS.</span></h2>
                        <p class="testimony__review">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ut est
                            esse, niam laboriosam saepe reiciendis dolorem. Cum, ratione voluptatum!</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="./images/face3.jpg" class="testimony__img">
                    </figure>
                </section>

                <section class="testimony__body" data-id="4">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Kevin Ramirez, <span class="testimony__course">estudiante de
                                CSS.</span></h2>
                        <p class="testimony__review">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ut est
                            esse, niam laboriosam saepe reiciendis dolorem. Cum, ratione voluptatum!</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="./images/face4.jpg" class="testimony__img">
                    </figure>
                </section>


                <img src="./images/rightarrow.svg" class="testimony__arrow" id="next">
            </div>
        </section>

        <section class="questions container">
            <h2 class="subtitle">Preguntas frecuentes</h2>
            <p class="questions__paragraph">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea, porro
                doloribus neque perspiciatis sapiente fuga.</p>

            <section class="questions__container">
                <article class="questions__padding">
                    <div class="questions__answer">
                        <h3 class="questions__title">¿Qué es CSS?
                            <span class="questions__arrow">
                                <img src="./images/arrow.svg" class="questions__img">
                            </span>
                        </h3>

                        <p class="questions__show">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quos
                            facere, quidem eum id excepturi assumenda explicabo nam accusamus veritatis voluptates
                            eveniet adipisci, dicta nihil nemo modi possimus officiis quam atque? Lorem ipsum, dolor sit
                            amet consectetur adipisicing elit. Quos facere, quidem eum id excepturi assumenda explicabo
                            nam accusamus veritatis voluptates eveniet adipisci, dicta nihil nemo modi possimus officiis
                            quam atque?</p>
                    </div>
                </article>

                <article class="questions__padding">
                    <div class="questions__answer">
                        <h3 class="questions__title">¿Qué aprenderé en este curso?
                            <span class="questions__arrow">
                                <img src="./images/arrow.svg" class="questions__img">
                            </span>
                        </h3>

                        <p class="questions__show">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quos
                            facere, quidem eum id excepturi assumenda explicabo nam accusamus veritatis voluptates
                            eveniet adipisci, dicta nihil nemo modi possimus officiis quam atque? Lorem ipsum, dolor sit
                            amet consectetur adipisicing elit. Quos facere, quidem eum id excepturi assumenda explicabo
                            nam accusamus veritatis voluptates eveniet adipisci, dicta nihil nemo modi possimus officiis
                            quam atque?</p>
                    </div>
                </article>

                <article class="questions__padding">
                    <div class="questions__answer">
                        <h3 class="questions__title">¿Qué es CSS GRID?
                            <span class="questions__arrow">
                                <img src="./images/arrow.svg" class="questions__img">
                            </span>
                        </h3>

                        <p class="questions__show">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quos
                            facere, quidem eum id excepturi assumenda explicabo nam accusamus veritatis voluptates
                            eveniet adipisci, dicta nihil nemo modi possimus officiis quam atque? Lorem ipsum, dolor sit
                            amet consectetur adipisicing elit. Quos facere, quidem eum id excepturi assumenda explicabo
                            nam accusamus veritatis voluptates eveniet adipisci, dicta nihil nemo modi possimus officiis
                            quam atque?</p>
                    </div>
                </article>
            </section>

            <section class="questions__offer">
                <h2 class="subtitle">¿Estas listo para aprender CSS?</h2>
                <p class="questions__copy">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet ratione
                    architecto magnam, officiis ex porro vero est voluptates quaerat quibusdam illo veniam reprehenderit
                    eius atque tempora iure ab non autem.</p>
                <a href="#" class="cta">Aprende ahora</a>
            </section>
        </section>
    </main>

    <footer class="footer">
        <section class="footer__container container">
            <nav class="nav nav--footer">
                <h2 class="footer__title">Curso CSS.</h2>

                <ul class="nav__link nav__link--footer">
                    <li class="nav__items">
                        <a href="#" class="nav__links">Inicio</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Acerca de</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Contacto</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Blog</a>
                    </li>
                </ul>
            </nav>

            <form class="footer__form" action="https://formspree.io/f/mknkkrkj" method="POST">
                <h2 class="footer__newsletter">Suscribete a la newsletter</h2>
                <div class="footer__inputs">
                    <input type="email" placeholder="Email:" class="footer__input" name="_replyto">
                    <input type="submit" value="Registrate" class="footer__submit">
                </div>
            </form>
        </section>

        <section class="footer__copy container">
            <div class="footer__social">
                <a href="#" class="footer__icons"><img src="./images/facebook.svg" class="footer__img"></a>
                <a href="#" class="footer__icons"><img src="./images/twitter.svg" class="footer__img"></a>
                <a href="#" class="footer__icons"><img src="./images/youtube.svg" class="footer__img"></a>
            </div>

            <h3 class="footer__copyright">Derechos reservados &copy; Jordan Alexander</h3>
        </section>
    </footer>

    <script src="./js/slider.js"></script>
    <script src="./js/questions.js"></script>
    <script src="./js/menu.js"></script>
</body>

</html>
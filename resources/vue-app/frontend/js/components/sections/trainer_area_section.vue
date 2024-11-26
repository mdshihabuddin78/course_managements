<template>
    <section class="trainer_area section_gap_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="main_title">
                        <h2 class="mb-3">Our Expert Trainers</h2>
                        <p>
                            Replenish man have thing gathering lights yielding shall you
                        </p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center d-flex align-items-center">
                <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
                    <div class="thumb d-flex justify-content-sm-center">
                        <img class="img-fluid trainer-img" :src="baseUrl + '/frontend/img/trainer/mehedi.png'" alt=""/>
                    </div>
                    <div class="meta-text text-sm-center">
                        <h4>Mehedi Hasan</h4>
                        <p class="designation">jr. web developer</p>
                        <div class="mb-4">
                            <p>
                                If you are looking at blank cassettes on the web, you may be
                                very confused at.
                            </p>
                        </div>
                        <div class="social-icons align-items-center justify-content-center d-flex">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
                    <div class="thumb d-flex justify-content-sm-center">
                        <img class="img-fluid trainer-img" :src="baseUrl + '/frontend/img/trainer/mamun.png'" alt=""/>
                    </div>
                    <div class="meta-text text-sm-center">
                        <h4>Al Mamun</h4>
                        <p class="designation">jr. web developer</p>
                        <div class="mb-4">
                            <p>
                                If you are looking at blank cassettes on the web, you may be
                                very confused at.
                            </p>
                        </div>
                        <div class="social-icons align-items-center justify-content-center d-flex">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
                    <div class="thumb d-flex justify-content-sm-center">
                        <img class="img-fluid trainer-img" :src="baseUrl + '/frontend/img/trainer/shihab.png'" alt=""/>
                    </div>
                    <div class="meta-text text-sm-center">
                        <h4>Shihab</h4>
                        <p class="designation">jr. web developer</p>
                        <div class="mb-4">
                            <p>
                                If you are looking at blank cassettes on the web, you may be
                                very confused at.
                            </p>
                        </div>
                        <div class="social-icons align-items-center justify-content-center d-flex">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
                    <div class="thumb d-flex justify-content-sm-center">
                        <img class="img-fluid trainer-img" :src="baseUrl + '/frontend/img/trainer/t4.jpg'" alt=""/>
                    </div>
                    <div class="meta-text text-sm-center">
                        <h4>Nathan Macken</h4>
                        <p class="designation">Sr. web designer</p>
                        <div class="mb-4">
                            <p>
                                If you are looking at blank cassettes on the web, you may be
                                very confused at.
                            </p>
                        </div>
                        <div class="social-icons align-items-center justify-content-center d-flex">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: 'trainer_area_section'
    }
</script>

<style scoped>
    .trainer-img {
        border-radius: 50%;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        width: 150px;
        height: 150px;
        object-fit: cover;
    }

    .single-trainer {
        border: 1px solid transparent;
        transition: border 0.3s ease, color 0.3s ease;
        padding: 20px;
        border-radius: 10px;
    }

    .single-trainer:hover {
        border: 1px solid #ff5e14;
        background-color: #f9f9f9;
    }

    .single-trainer:hover .trainer-img {
        transform: scale(1.05);
        box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.3);
    }

    .meta-text {
        margin-top: 20px;
    }

    .meta-text h4 {
        font-weight: 600;
        font-size: 1.25rem;
        color: #333;
        transition: color 0.3s ease;
    }

    .meta-text .designation {
        font-style: italic;
        color: #777;
        font-size: 0.95rem;
        margin-bottom: 15px;
        transition: color 0.3s ease;
    }

    .meta-text p {
        color: #666;
        transition: color 0.3s ease;
    }

    .single-trainer:hover .meta-text h4,
    .single-trainer:hover .meta-text .designation,
    .single-trainer:hover .meta-text p {
        color: #ff5e14;
    }

    .social-icons a {
        font-size: 1.2rem;
        color: #555;
        margin: 0 8px;
        transition: color 0.3s ease;
    }

    .single-trainer:hover .social-icons a {
        color: #ff5e14;
    }

    .social-icons a:hover {
        color: #ff5e14;
    }
</style>

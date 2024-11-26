<template>
    <div class="container my-5 pb-5">
        <div  class="main_title">
            <h2 class="mb-3">Explore Categories</h2>
            <p>Discouraged and irrelevant life attitudes. You're you. Sneak peek into what has in store.</p>
        </div>
        <hr class="custom-hr" />
        <div class="row">
            <!-- Category Images -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4" v-for="(category, index) in displayedCategories" :key="index">
                <router-link :to="{ name: 'courses', params: { cat_id: category.id } }" class="card h-100 shadow border-0 custom-card">
                    <div class="text-center">
                        <img class="card-img-top img-fluid" :src="generateFileUrl(category.thumbnail, TYPE_CATEGORY)" :alt="category.title" />
                    </div>
                    <div class="text-center">
                        <h6 class="card-title mb-0 text-truncate">{{ category.title }}</h6>
                        <p class="course-count mt-0">{{ category.courses ? category.courses.length : 0 }} courses available</p>
                    </div>
                </router-link>
            </div>
        </div>

        <div class="text-center mt-4">
            <button v-if="!showAll" @click="toggleShow" class="primary-btn2 mb-3 mb-sm-0">
                See More <i class="fas fa-chevron-down ml-2"></i>
            </button>
            <button v-if="showAll" @click="toggleShow" class="primary-btn ml-sm-3 ml-0">
                See Less <i class="fas fa-chevron-up ml-2"></i>
            </button>
        </div>


    </div>
</template>

<script>
    export default {
        name: "explore_categories_section",

        props: {
            categories: {
                type: [Object, Array],
                default: () => []
            }
        },

        data() {
            return {
                showAll: false,
                limit: 8
            };
        },

        computed: {
            displayedCategories() {
                return this.showAll ? this.categories : this.categories.slice(0, this.limit);
            }
        },

        methods: {
            toggleShow() {
                this.showAll = !this.showAll;
            }
        }
    };
</script>

<style scoped>
    .card {
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        border-radius: 8px;
        border: 1px solid #e0e0e0;
        background-color: #ffffff;
    }

    .card-img-top {
        max-height: 80px;
        width: auto;
        border-radius: 8px 8px 0 0;
    }

    .card:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
    }

    .card-title {
        font-weight: 500;
        color: #333;
    }

    .course-count {
        font-weight: 400;
        color: #666;
        margin-top: 10px;
    }

    .text-truncate {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    @media (max-width: 768px) {
        .card-img-top {
            max-height: 60px;
        }
    }
</style>
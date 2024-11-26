<template>
    <div class="search-component">
        <li class="nav-item">
            <a href="#" class="nav-link search" @click.prevent="openSearchModal">
                <i class="ti-search"></i>
            </a>
        </li>

        <!-- Search Modal -->
        <div v-if="isModalVisible" class="modal-overlay" @click.self="closeSearchModal">
            <div class="modal-content">
                <span class="close ml-auto" @click="closeSearchModal" style="float: right;">&times;</span>
                <h2 class="modal-title">Search</h2>
                <div class="search-input-container">
                    <input
                            v-model="searchQuery"
                            @input="debouncedSearch"
                            placeholder="Search for users, courses, lessons, categories..."
                            class="search-input"
                    />
                    <button class="search-button" @click="performSearch">Search</button>
                </div>

                <!-- Scrollable Results Section -->
                <div class="results-section">
                    <!-- USERS -->
                    <div v-if="results.users.length">
                        <h3>USERS</h3>
                        <div v-for="user in results.users" :key="user.id" class="result-item">
                            <router-link :to="`/users/${user.id}`" @click.native="handleResultClick">
                                {{ user.name.toLowerCase() }} - {{ user.email.toLowerCase() }}
                            </router-link>
                        </div>
                    </div>

                    <!-- COURSES -->
                    <div v-if="results.courses.length">
                        <h3>COURSES</h3>
                        <div v-for="course in results.courses" :key="course.id" class="result-item">
                            <router-link :to="`/courses/${course.id}`" @click.native="handleResultClick" class="d-flex">
                                <img :src="generateFileUrl(course.thumbnail, TYPE_COURSE)" height="70px" width="100px">
                                <div>
                                    <h3>{{ course.title }}</h3>
                                    <span>{{course.category.title}}</span>
                                </div>
                            </router-link>
                        </div>
                    </div>

                    <!-- LESSONS -->
                    <div v-if="results.lessons.length">
                        <h3>LESSONS</h3>
                        <div v-for="lesson in results.lessons" :key="lesson.id" class="result-item">
                            <router-link :to="`/lesson/${lesson.id}`" @click.native="handleResultClick">
                                {{ lesson.title.toLowerCase() }}
                            </router-link>
                        </div>
                    </div>

                    <!-- CATEGORIES -->
                    <div v-if="results.categories.length">
                        <h3>CATEGORIES</h3>
                        <div v-for="category in results.categories" :key="category.id" class="result-item">
                            <router-link :to="`/categories/${category.id}`" @click.native="handleResultClick">
                                {{ category.title.toLowerCase() }}
                            </router-link>
                        </div>
                    </div>

                    <!-- SUBCATEGORIES -->
                    <div v-if="results.subcategories.length">
                        <h3>SUBCATEGORIES</h3>
                        <div v-for="subcategory in results.subcategories" :key="subcategory.id" class="result-item">
                            <router-link :to="`/subcategories/${subcategory.id}`" @click.native="handleResultClick">
                                {{ subcategory.title.toLowerCase() }}
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    import Swal from 'sweetalert2';
    import debounce from 'lodash/debounce';

    export default {
        data() {
            return {
                isModalVisible: false, // Controls the visibility of the search modal
                searchQuery: '', // Holds the search input
                results: {
                    users: [], // Store search results for users
                    courses: [], // Store search results for courses
                    lessons: [], // Store search results for lessons
                    categories: [], // Store search results for categories
                    subcategories: [], // Store search results for subcategories
                }
            };
        },
        computed: {
            suggestionsAvailable() {
                // Check if any category has results to show suggestions
                return this.results.users.length ||
                    this.results.courses.length ||
                    this.results.lessons.length ||
                    this.results.categories.length ||
                    this.results.subcategories.length;
            },
            combinedResults() {
                // Flatten and combine all result types into a single array for display
                return [
                    ...this.results.users.map(user => ({ title: user.name, link: `/users/${user.id}` })),
                    ...this.results.courses.map(course => ({ title: course.title, link: `/courses/${course.id}` })),
                    ...this.results.lessons.map(lesson => ({ title: lesson.title, link: `/lesson/${lesson.id}` })),
                    ...this.results.categories.map(category => ({ title: category.title, link: `/categories/${category.id}` })),
                    ...this.results.subcategories.map(subcategory => ({ title: subcategory.title, link: `/subcategories/${subcategory.id}` })),
                ];
            }
        },
        methods: {
            openSearchModal() {
                this.isModalVisible = true; // Show the modal
                document.body.style.overflow = 'hidden'; // Disable scrolling on the body
            },
            closeSearchModal() {
                this.isModalVisible = false; // Hide the modal
                this.results = { // Clear results when closing the modal
                    users: [],
                    courses: [],
                    lessons: [],
                    categories: [],
                    subcategories: [],
                };
                this.searchQuery = ''; // Clear search input
                document.body.style.overflow = ''; // Enable scrolling on the body
            },
            async performSearch() {
                if (this.searchQuery) {
                    try {
                        const response = await axios.get('/search', {
                            params: { query: this.searchQuery }
                        });
                        this.results = response.data; // Store results

                        // Check if all result arrays are empty
                        if (
                            !this.results.users.length &&
                            !this.results.courses.length &&
                            !this.results.lessons.length &&
                            !this.results.categories.length &&
                            !this.results.subcategories.length
                        ) {
                            // Show a simplified SweetAlert message if no results found
                            Swal.fire({
                                icon: 'warning',
                                title: 'No Results Found',
                                text: 'Please try again with different keywords.',
                                confirmButtonText: 'OK',
                                confirmButtonColor: '#423a8e', // Button color
                            });
                        }
                    } catch (error) {
                        console.error('Search request failed:', error);
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Something went wrong. Please try again later.',
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#d33',
                        });
                    }
                }
            },
            async search() {
                if (this.searchQuery.trim()) {
                    try {
                        const response = await axios.get('/search', {
                            params: { query: this.searchQuery }
                        });
                        this.results = response.data;
                    } catch (error) {
                        console.error('Error fetching search results:', error);
                    }
                }
            },
            handleResultClick() {
                this.closeSearchModal(); // Close modal when a result is clicked
            }
        },
        created() {
            this.debouncedSearch = debounce(this.search); // Debounce search to reduce API requests
        }
    };
</script>

<style scoped>
    .search-input-container {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .search-input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 100%;
        font-size: 16px;
        margin-right: 10px;
    }

    .search-button {
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }

    .search-button:hover {
        background-color: #0056b3;
    }

    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.7);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;
        overflow: hidden;
    }

    .modal-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        width: 60%;
        max-width: 800px;
        max-height: 80%;
        overflow-y: auto;
    }

    .modal-title {
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: bold;
    }

    .results-section {
        max-height: 400px;
        overflow-y: auto;
    }

    h3 {
        margin-bottom: 10px;
    }

    .result-item {
        padding: 10px 0;
        border-bottom: 1px solid #ddd;
    }

    .result-item:hover {
        background-color: #f5f5f5;
    }

    .result-item a {
        text-decoration: none;
        color: #333;
    }

    .result-item img {
        margin-right: 10px;
    }
</style>

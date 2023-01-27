<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\AboutUs>
 */
class AboutUsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'currency' => 'USD',
            'currency_symbol' => '$',
            'fast_delivery' => $this->faker->sentence(),
            'free_shipping' => $this->faker->sentence(),
            'best_quality' => $this->faker->sentence(),
            'banner' => $this->faker->imageUrl(640,480),
            'banner_title' => $this->faker->name,
            'banner_content' => $this->faker->sentence(),
            'subscriber_content' => $this->faker->sentence(),
        ];
    }
}

class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :category_icons, only: [:new, :create, :edit, :update]
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit
        end
    end

    private
        def set_category
            @category = Category.find(params[:id])
        end
        def category_params
            params.require(:category).permit!
        end
        def category_icons 
            @icon_names = [
                'ambulance',
                'h square',
                'heart',
                'heart outline',
                'heartbeat',
                'hospital',
                'medkit',
                'plus square',
                'plus square outline',
                'user md',
                'wheelchair',
                'dollar sign',
                'euro sign',
                'lira sign',
                'pound sign',
                'ruble sign',
                'rupee sign',
                'shekel sign',
                'won sign',
                'yen sign',
                'clipboard list',
                'shipping fast',
                'truck',
                'ambulance',
                'anchor',
                'balance scale',
                'bath',
                'bed',
                'beer',
                'bell',
                'bell outline',
                'bell slash',
                'bell slash outline',
                'bicycle',
                'binoculars',
                'birthday cake',
                'blind',
                'bomb',
                'book',
                'bookmark',
                'bookmark outline',
                'briefcase',
                'building',
                'building outline',
                'car',
                'coffee',
                'crosshairs',
                'dollar sign',
                'eye',
                'fighter jet',
                'fire',
                'fire extinguisher',
                'flag',
                'flag outline',
                'flag checkered',
                'flask',
                'gamepad',
                'gift',
                'globe',
                'graduation cap',
                'h square',
                'heart',
                'heart outline',
                'heartbeat',
                'home',
                'hospital',
                'industry',
                'info',
                'info circle',
                'key',
                'leaf',
                'lemon',
                'life ring',
                'lightbulb',
                'location arrow',
                'low vision',
                'magnet',
                'male',
                'map',
                'map outline',
                'map signs',
                'medkit',
                'motorcycle',
                'music',
                'newspaper',
                'paw',
                'phone',
                'phone square',
                'phone volume',
                'plug',
                'plus',
                'plus square',
                'plus square outline',
                'print',
                'recycle',
                'road',
                'rocket',
                'search',
                'search minus',
                'search plus',
                'ship',
                'shopping bag',
                'shopping basket',
                'shopping cart',
                'shower',
                'street view',
                'subway',
                'suitcase',
                'tag',
                'tags',
                'taxi',
                'ticket alternate',
                'tint',
                'train',
                'tree',
                'trophy',
                'truck',
                'tty',
                'umbrella',
                'university',
                'utensil spoon',
                'wheelchair',
                'wifi',
                'wrench',
                'desktop',
                'download',
                'hdd outline',
                'keyboard',
                'laptop',
                'microchip',
                'mobile',
                'mobile alternate',
                'plug',
                'power off',
                'print',
                'save',
                'server',
                'tablet',
                'tablet alternate',
                'tv',
                'upload',
                'ambulance',
                'first aid',
                'heart',
                'heart outline',
                'heartbeat',
                'hospital',
                'hospital symbol',
                'plus',
                'thermometer',
                'user md',
                'gift',
                'credit card',
                'bus',
                'car',
                'plane',
        ].uniq.sort
        end
end
